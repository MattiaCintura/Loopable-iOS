//
//  ProductModels.swift
//  Loopable
//
//  Created by Mattia Cintura on 10/07/23.
//

import Foundation

struct Product: Codable, Hashable {
    let id: Int
    var name: String
    var description: String
    var owner: String
    var price: Double
    var category: ProductCategory
    var images: [String]
    var createdAt: Date
    var updatedAt: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case owner
        case price
        case category
        case images
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
    
    init(id: Int, name: String, description: String, owner: String, price: Double, category: ProductCategory, images: [String], createdAt: Date, updatedAt: Date) {
        self.id = id
        self.name = name
        self.description = description
        self.owner = owner
        self.price = price
        self.category = category
        self.images = images
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decode(String.self, forKey: .description)
        self.owner = try container.decode(String.self, forKey: .owner)
        self.price = try container.decode(Double.self, forKey: .price)
        self.category = try container.decode(ProductCategory.self, forKey: .category)
        self.images = try container.decode([String].self, forKey: .images)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.owner, forKey: .owner)
        try container.encode(self.price, forKey: .price)
        try container.encode(self.category, forKey: .category)
        try container.encode(self.images, forKey: .images)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }
}
