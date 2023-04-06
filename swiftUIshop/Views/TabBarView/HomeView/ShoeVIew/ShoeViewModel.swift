//
//  ShoeViewModel.swift
//  swiftUIshop
//
//  Created by Evgeny on 25.03.23.
//

import Foundation

class ShoeViewModel: ObservableObject {
    // MARK: Published Properties
    @Published var item: Shoe?
    // MARK: Private Properties
    private let dataService = DataService()
    
    // MARK: Methods
    func loadData(completion: @escaping (Error?) -> Void) {
        dataService.fetchShoe { [weak self] item in
            DispatchQueue.main.async {
                self?.item = item
                completion(nil)
            }
        }
    }
}
