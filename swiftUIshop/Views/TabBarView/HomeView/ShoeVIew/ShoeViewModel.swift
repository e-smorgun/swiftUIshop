//
//  ShoeViewModel.swift
//  swiftUIshop
//
//  Created by Evgeny on 25.03.23.
//

import Foundation

class ShoeViewModel: ObservableObject {
    @Published var item: Shoe?
    private let dataService = DataService()
    
    func loadData(completion: @escaping (Error?) -> Void) {
        dataService.fetchShoe { [weak self] item in
            DispatchQueue.main.async {
                self?.item = item
                completion(nil)
            }
        }
    }
}
