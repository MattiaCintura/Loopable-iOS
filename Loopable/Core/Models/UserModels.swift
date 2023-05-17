//
//  UserModels.swift
//  Loopable
//
//  Created by Mattia Cintura on 14/05/23.
//

import Foundation

struct UserModel: Codable {
    let id: String
    let email: String?
    var firstName: String?
    var lastName: String?
    var province: ProvinceOfItaly?
    var photoUrl: String?
    let createdAt: Date?
    var updatedAt: Date?
    
    init(auth: AuthDataResultModel) {
        self.id = auth.uid
        self.email = auth.email
        self.firstName = nil
        self.lastName = nil
        self.photoUrl = nil
        self.province = nil
        self.createdAt = Date()
        self.updatedAt = Date()
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.firstName = try container.decodeIfPresent(String.self, forKey: .firstName)
        self.lastName = try container.decodeIfPresent(String.self, forKey: .lastName)
        self.photoUrl = try container.decodeIfPresent(String.self, forKey: .photoUrl)
        self.province = try container.decodeIfPresent(ProvinceOfItaly.self, forKey: .province)
        self.createdAt = try container.decodeIfPresent(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decodeIfPresent(Date.self, forKey: .updatedAt)
    }
    
    init(
        id: String,
        email: String? = nil,
        firstName: String? = nil,
        lastName: String? = nil,
        photoUrl: String? = nil,
        province: ProvinceOfItaly? = nil,
        createdAt: Date? = nil,
        updatedAt: Date? = nil
    ) {
        self.id = id
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.province = province
        self.photoUrl = photoUrl
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case email = "email"
        case firstName = "first_name"
        case province = "province"
        case lastName = "last_name"
        case photoUrl = "photo_url"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encodeIfPresent(self.email, forKey: .email)
        try container.encodeIfPresent(self.firstName, forKey: .firstName)
        try container.encodeIfPresent(self.lastName, forKey: .lastName)
        try container.encodeIfPresent(self.photoUrl, forKey: .photoUrl)
        try container.encodeIfPresent(self.province?.rawValue, forKey: .province)
        try container.encodeIfPresent(self.createdAt, forKey: .createdAt)
        try container.encodeIfPresent(self.updatedAt, forKey: .updatedAt)
    }
}
