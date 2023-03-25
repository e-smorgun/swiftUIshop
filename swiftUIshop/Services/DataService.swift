//
//  DataService.swift
//  swiftUIshop
//
//  Created by Evgeny on 21.03.23.
//

import Foundation
import Combine

class DataService {
 
    func fetchShoe(completion: @escaping (Shoe?) -> Void) {
        let url = URL(string: "https://run.mocky.io/v3/f7f99d04-4971-45d5-92e0-70333383c239")!

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("data", data)
                completion(nil)
                return
            }

            let decoder = JSONDecoder()
            do {
                let result = try decoder.decode(Shoe.self, from: data)
                print(result.name) // "Nike Air Max"
                completion(result)

            } catch {
                print("error", error)
                completion(nil)
            }
        }.resume()
    }
    
    func fetchLatestItems(completion: @escaping ([LatestItem]?) -> Void) {
        let url = URL(string: "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7")!

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode([String:[LatestItem]].self, from: data)
                let items = result["latest"]
                completion(items)
            } catch {
                completion(nil)
            }
        }.resume()
    }

    func fetchFlashSaleItems(completion: @escaping ([FlashSaleItem]?) -> Void) {
        let url = URL(string: "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac")!

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode([String:[FlashSaleItem]].self, from: data)
                let items = result["flash_sale"]
                print(items)
                completion(items)
            } catch {
                completion(nil)
            }
        }.resume()
    }


    func fetchData(completion: @escaping (Item) -> Void) {
        var item = Item()

        print(item)
        fetchLatestItems { latestItems in
            item.latest = latestItems

            if item.flashSale != nil {
                print(item)
                completion(item)
            }
        }

        fetchFlashSaleItems { flashSaleItems in
            item.flashSale = flashSaleItems

            if item.latest != nil {
                print(item)
                completion(item)
            }
        }
    }

}
