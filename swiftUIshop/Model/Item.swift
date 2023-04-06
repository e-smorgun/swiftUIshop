//
//  Category.swift
//  swiftUIshop
//
//  Created by Evgeny on 21.03.23.
//

import Foundation

// MARK: - FlashSaleItem
// A model representing an item on a flash sale.
struct FlashSaleItem: Codable, Hashable {
    // MARK: Properties
    let category: String
    let name: String
    let price: Double
    let discount: Int
    let imageUrl: String
    
    // MARK: CodingKeys
    enum CodingKeys: String, CodingKey {
        case category, name, price, discount
        case imageUrl = "image_url"
    }
    
    // MARK: Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

// MARK: - LatestItem
// A model representing the latest item.
struct LatestItem: Codable, Hashable {
    // MARK: Properties
    let category: String
    let name: String
    let price: Double
    let imageUrl: String
    
    // MARK: CodingKeys
    enum CodingKeys: String, CodingKey {
        case category, name, price
        case imageUrl = "image_url"
    }
    
    // MARK: Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

// MARK: - Item
// A model representing an item, which may contain both flash sale and latest items.
struct Item: Codable, Hashable {
    var flashSale: [FlashSaleItem]?
    var latest: [LatestItem]?
}
