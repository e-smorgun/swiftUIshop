//
//  HomeViewModel.swift
//  swiftUIshop
//
//  Created by Evgeny on 20.03.23.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var item: Item?
    private let dataService = DataService()
    
    func loadData(completion: @escaping (Error?) -> Void) {
        dataService.fetchData { [weak self] item in
            self?.item = item
            completion(nil)
        }
    }
}
