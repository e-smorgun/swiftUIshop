//
//  Shoe.swift
//  swiftUIshop
//
//  Created by Evgeny on 25.03.23.
//

struct Shoe: Decodable {
    let name: String
    let description: String
    let rating: Double
    let number_of_reviews: Int
    let price: Double
    let colors: [String]
    let image_urls: [String]
}
