//
//  UserManager.swift
//  Loopable
//
//  Created by Mattia Cintura on 14/05/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class UserManager {
    // TODO: Use dependency injection
    static let shared = UserManager()
    
    private let collection = Firestore.firestore().collection(FirestoreCollection.users.rawValue)

    private init () { }
    
    private func userDocument(userId: String) -> DocumentReference {
        collection.document(userId)
    }
    
    func getUserById(userId: String) async throws -> UserModel {
        try await userDocument(userId: userId).getDocument(as: UserModel.self)
    }
    
    func addUserToCollection(user: UserModel) async throws {
        try userDocument(userId: user.id).setData(from: user, merge: false)
    }
}
