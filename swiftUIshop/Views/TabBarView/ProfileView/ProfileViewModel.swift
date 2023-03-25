//
//  AccountViewModel.swift
//  swiftUIshop
//
//  Created by Evgeny on 20.03.23.
//

import SwiftUI
import Combine

class ProfileViewModel: ObservableObject {
    @Published var profileImage: UIImage? = nil
    private var cancellables = Set<AnyCancellable>()
    private let imagePickerDelegate = ImagePickerDelegate()
    
    func selectPhoto() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        imagePicker.delegate = imagePickerDelegate
        
        imagePickerDelegate.imageSelectedPublisher
            .sink { image in
                self.profileImage = image
            }
            .store(in: &cancellables)
        
        UIApplication.shared.windows.first?.rootViewController?.present(imagePicker, animated: true, completion: nil)
    }
}

class ImagePickerDelegate: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    let imageSelectedPublisher = PassthroughSubject<UIImage, Never>()
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            imageSelectedPublisher.send(image)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
