//
//  HomeViewModel.swift
//  swiftUIshop
//
//  Created by Evgeny on 20.03.23.
//

import Foundation

class HomeViewModel: ObservableObject {
    // MARK: Published Properties
    @Published var item: Item?
    
    // MARK: Private Properties
    private let dataService = DataService()
    
    // MARK: Methods
    func loadData(completion: @escaping (Error?) -> Void) {
        dataService.fetchData { [weak self] item in
            self?.item = item
            completion(nil)
        }
    }
}
