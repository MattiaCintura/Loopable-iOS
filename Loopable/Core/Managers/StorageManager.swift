//
//  StorageManager.swift
//  Loopable
//
//  Created by Mattia Cintura on 02/06/23.
//

import Foundation
import FirebaseStorage

final class StorageManager {
    // TODO: Use dependency injection
    static let shared = StorageManager()
    
    private let storage = Storage.storage().reference()
    
    typealias SaveImageResult = (path: String, name: String)
    
    private init() { }
    
    func saveImage(data: Data) async throws -> SaveImageResult {
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        let path = "\(UUID().uuidString).jpeg"
        let resultMetadata = try await storage.child(path).putDataAsync(data, metadata: metadata)
        
        guard let resultPath = resultMetadata.path, let resultName = resultMetadata.name else {
            throw URLError(.badServerResponse)
        }
        
        return (resultPath, resultName)
    }
}
