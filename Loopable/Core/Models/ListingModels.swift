//
//  ListingModels.swift
//  Loopable
//
//  Created by Mattia Cintura on 01/06/23.
//

import Foundation
import UIKit

struct ProductListing: Codable {
    let id: UUID
    var title: String
    var descriprion: String
    var areaOfInterest: ProvinceOfItaly?
    var dailyPrice: Double
    var images: [String]
    var category: ProductCategory?
    var yearOfPurchase: Int
    var condition: ProductCondition?
    var availabilityFrom: Date
    var phoneNumber: String
    var ownerId: String
    
    init() {
        self.id = UUID()
        self.title = ""
        self.descriprion = ""
        self.areaOfInterest = nil
        self.dailyPrice = 0
        self.images = []
        self.category = nil
        self.yearOfPurchase = 0
        self.condition = nil
        self.availabilityFrom = Date()
        self.phoneNumber = ""
        self.ownerId = ""
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.descriprion = try container.decode(String.self, forKey: .descriprion)
        self.areaOfInterest = try container.decodeIfPresent(ProvinceOfItaly.self, forKey: .areaOfInterest)
        self.dailyPrice = try container.decode(Double.self, forKey: .dailyPrice)
        self.images = try container.decode([String].self, forKey: .images)
        self.category = try container.decodeIfPresent(ProductCategory.self, forKey: .category)
        self.yearOfPurchase = try container.decode(Int.self, forKey: .yearOfPurchase)
        self.condition = try container.decodeIfPresent(ProductCondition.self, forKey: .condition)
        self.availabilityFrom = try container.decode(Date.self, forKey: .availabilityFrom)
        self.phoneNumber = try container.decode(String.self, forKey: .phoneNumber)
        self.ownerId = try container.decode(String.self, forKey: .ownerId)
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case descriprion = "descriprion"
        case areaOfInterest = "area_of_interest"
        case dailyPrice = "daily_price"
        case images = "images"
        case category = "category"
        case yearOfPurchase = "year_of_purchase"
        case condition = "condition"
        case availabilityFrom = "availability_from"
        case phoneNumber = "phone_number"
        case ownerId = "owner_id"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.descriprion, forKey: .descriprion)
        try container.encodeIfPresent(self.areaOfInterest, forKey: .areaOfInterest)
        try container.encode(self.dailyPrice, forKey: .dailyPrice)
        try container.encode(self.images, forKey: .images)
        try container.encodeIfPresent(self.category, forKey: .category)
        try container.encode(self.yearOfPurchase, forKey: .yearOfPurchase)
        try container.encodeIfPresent(self.condition, forKey: .condition)
        try container.encodeIfPresent(self.availabilityFrom, forKey: .availabilityFrom)
        try container.encodeIfPresent(self.phoneNumber, forKey: .phoneNumber)
        try container.encodeIfPresent(self.ownerId, forKey: .ownerId)
    }
}
