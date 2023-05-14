//
//  AuthenticationModels.swift
//  Loopable
//
//  Created by Mattia Cintura on 10/05/23.
//

import Foundation
import FirebaseAuth

typealias UserFirebase = User

struct AuthDataResultModel {
    let uid: String
    let email: String?
    let photoUrl: String?
    
    init(user: UserFirebase) {
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
}

struct SignInWithAppleResultModel {
    let token: String
    let nonce: String
}
