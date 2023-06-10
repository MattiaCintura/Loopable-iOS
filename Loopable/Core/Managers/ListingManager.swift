//
//  ListingManager.swift
//  Loopable
//
//  Created by Mattia Cintura on 01/06/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class ListingManager {
    // TODO: Use dependency injection
    static let shared = ListingManager()
    
    private let collection = Firestore.firestore().collection(FirestoreCollection.productListing.rawValue)
    
    private init() {}
}
