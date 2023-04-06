//
//  ShoeView.swift
//  swiftUIshop
//
//  Created by Evgeny on 25.03.23.
//

import SwiftUI

struct ShoeView: View {
    // MARK: - Properties
    @EnvironmentObject var viewModel: ShoeViewModel
    var coordinator: AppCoordinator
    @State private var selectedImageIndex = 0
    @State var selectedColor: Color?
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 0) {
            if viewModel.item != nil {
                shoeImageCarouselView
                Spacer(minLength: 20)
                shoeDescription
                Spacer(minLength: 20)
                coloredView
                Spacer(minLength: 20)
                bottomView
                
            } else {
                Color(red: 250/255, green: 251/255, blue: 255/255)
                    .ignoresSafeArea()
                    .overlay(Text("Error Data"))
            }
        }.onAppear {
            viewModel.loadData { error in
                if let error = error {
                    print("Error loading data: \(error.localizedDescription)")
                }
            }
        }
    }
    
    // MARK: - SubViews
    private var shoeImageCarouselView: some View {
        VStack(alignment: .leading) {
            shoeImage(selectedImageIndex: $selectedImageIndex, imageUrl: viewModel.item!.image_urls[selectedImageIndex])
            imageScrollView(selectedImageIndex: $selectedImageIndex, shoe: viewModel.item!)
        }
    }
    
    private var shoeDescription: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(viewModel.item!.name)
                    .font(.custom("Montserrat-bold", size: 18))
                    .padding(.leading, 15)
                
                Spacer()
                
                Text("$\(viewModel.item!.price, specifier: "%.2f")")
                    .font(.custom("Montserrat-SemiBold", size: 16))
                    .padding(.trailing, 20)
            }
            
            Text(viewModel.item!.description)
                .font(.custom("Montserrat-Regular", size: 14))
                .foregroundColor(.gray)
                .frame(width: 250)
                .lineLimit(nil)
            
            HStack(spacing: 3) {
                Image(systemName: "star")
                    .foregroundColor(.yellow)
                
                Text("\(viewModel.item!.rating, specifier: "%.1f")")
                    .font(.custom("Montserrat-Bold", size: 14))
                
                Text("(\(viewModel.item!.number_of_reviews))")
                    .font(.custom("Montserrat-SemiBold", size: 12))
                    .foregroundColor(.gray)
            }
        }
        .padding(.top, 20)
        .padding(.leading, 20)
        .padding(.trailing, 20)
    }
    
    private var coloredView: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Color: ")
                .font(.custom("Montserrat-SemiBold", size: 14))
                .foregroundColor(.gray)
            
            HStack(spacing: 10) {
                ForEach(viewModel.item!.colors, id: \.self) { colorString in
                    let color = Color(hex: colorString)
                    Rectangle()
                        .fill(color)
                        .frame(width: 50, height: 30)
                        .cornerRadius(10)
                        .overlay(
                            Capsule(style: .continuous)
                                .stroke(selectedColor == color ? Color.gray : Color.clear, lineWidth: 4)
                                .cornerRadius(10)
                        )
                        .onTapGesture {
                            selectedColor = color
                        }
                }
                
                Spacer()
            }
            .onAppear {
                if let firstColorString = viewModel.item!.colors.first {
                    selectedColor = Color(hex: firstColorString)
                }
            }
        }.padding(.top, 20)
            .padding(.leading, 20)
    }
    
    private var bottomView: some View {
        Rectangle()
            .foregroundColor(Color(red: 24/255, green: 23/255, blue: 38/255))
            .frame(height: 100)
            .edgesIgnoringSafeArea(.bottom)
            .overlay {
                HStack(alignment: .top, spacing: 0) {
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Quantity:")
                            .font(.custom("Montserrat-SemiBold", size: 12))
                            .foregroundColor(.gray)
                        
                        HStack {
                            Button("-") {
                                //action add to cart
                            }.font(.custom("Montserrat-Bold", size: 14))
                                .frame(maxWidth: 45, maxHeight: 25)
                                .background(Color(red: 78/255, green: 85/255, blue: 215/255))
                                .cornerRadius(10)
                                .foregroundColor(.white)
                            
                            Button("+") {
                                //action add to cart
                            }.font(.custom("Montserrat-Bold", size: 14))
                                .frame(maxWidth: 45, maxHeight: 25)
                                .background(Color(red: 78/255, green: 85/255, blue: 215/255))
                                .cornerRadius(10)
                                .foregroundColor(.white)
                        }
                    }
                    
                    Spacer()
                    Spacer()
                    
                    Button("Add to cart") {
                        //action add to cart
                    }.font(.custom("Montserrat-Bold", size: 14))
                        .frame(maxWidth: 170, maxHeight: 45)
                        .background(Color(red: 78/255, green: 85/255, blue: 215/255))
                        .cornerRadius(15)
                        .foregroundColor(.white)
                    
                    Spacer()
                }
            }
    }
    
    // MARK: - Methods
    // MARK: Image
    func shoeImage(selectedImageIndex: Binding<Int>, imageUrl: String) -> some View {
        AsyncImage(url: URL(string: imageUrl)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                ZStack{
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350)
                        .cornerRadius(20)
                        .gesture(DragGesture(minimumDistance: 20)
                            .onEnded { value in
                                if value.translation.width > 0 {
                                    selectedImageIndex.wrappedValue = max(selectedImageIndex.wrappedValue - 1, 0)
                                } else {
                                    selectedImageIndex.wrappedValue = min(selectedImageIndex.wrappedValue + 1, viewModel.item!.image_urls.count - 1)
                                }
                            }
                        )
                }
            case .failure:
                Image(systemName: "exclamationmark.icloud.fill")
                    .font(.largeTitle)
                    .foregroundColor(.red)
            @unknown default:
                EmptyView()
            }
        }
    }
    
    // MARK: Image scroll
    func imageScrollView(selectedImageIndex: Binding<Int>, shoe: Shoe) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 8) {
                ForEach(0..<shoe.image_urls.count) { index in
                    AsyncImage(url: URL(string: shoe.image_urls[index])) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            if selectedImageIndex.wrappedValue == index {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 120, height: 60)
                                    .cornerRadius(8)
                                    .onTapGesture {
                                        selectedImageIndex.wrappedValue = index
                                    }
                            } else {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 40)
                                    .cornerRadius(8)
                                    .onTapGesture {
                                        selectedImageIndex.wrappedValue = index
                                    }
                            }
                            
                        case .failure:
                            Image(systemName: "exclamationmark.icloud.fill")
                                .font(.largeTitle)
                                .foregroundColor(.red)
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

// MARK: - Work With HEX color
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        self.init(red: Double((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: Double((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: Double(rgbValue & 0x0000FF) / 255.0)
    }
}

// MARK: - Prewiew
struct ShoeViewPrewiew: PreviewProvider {
    static var previews: some View {
        ShoeView(coordinator: AppCoordinator())
            .environmentObject(ShoeViewModel())
    }
}
