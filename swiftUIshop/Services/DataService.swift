//
//  DataService.swift
//  swiftUIshop
//
//  Created by Evgeny on 21.03.23.
//

import Foundation
import Combine

class DataService {
    private func fetchModel<T: Decodable>(from url: URL, completion: @escaping (T?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(T.self, from: data)
                completion(result)
            } catch {
                completion(nil)
            }
        }.resume()
    }

    func fetchShoe(completion: @escaping (Shoe?) -> Void) {
        let url = URL(string: "https://run.mocky.io/v3/f7f99d04-4971-45d5-92e0-70333383c239")!
        fetchModel(from: url, completion: completion)
    }

    func fetchLatestItems(completion: @escaping ([LatestItem]?) -> Void) {
        let url = URL(string: "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7")!
        fetchModel(from: url, completion: { (result: [String:[LatestItem]]?) in
            completion(result?["latest"])
        })
    }

    func fetchFlashSaleItems(completion: @escaping ([FlashSaleItem]?) -> Void) {
        let url = URL(string: "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac")!
        fetchModel(from: url, completion: { (result: [String:[FlashSaleItem]]?) in
            completion(result?["flash_sale"])
        })
    }

    func fetchData(completion: @escaping (Item) -> Void) {
        var item = Item()

        fetchLatestItems { latestItems in
            item.latest = latestItems

            if item.flashSale != nil {
                completion(item)
            }
        }

        fetchFlashSaleItems { flashSaleItems in
            item.flashSale = flashSaleItems

            if item.latest != nil {
                completion(item)
            }
        }
    }
}
