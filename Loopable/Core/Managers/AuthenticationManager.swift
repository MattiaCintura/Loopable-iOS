//
//  AuthenticationManager.swift
//  Loopable
//
//  Created by Mattia Cintura on 06/05/23.
//

import Foundation
import FirebaseAuth

final class AuthenticationManager {
    // TODO: Use dependency injection
    static let shared = AuthenticationManager()
    
    private init() { }
    
    func getAuthenticatedUser() throws -> AuthDataResultModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        
//        Task {
//            let test = try await user.getIDToken()
//        }
        
        return AuthDataResultModel(user: user)
    }
    
    @discardableResult
    func createUser(email: String, password: String) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }
    
    @discardableResult
    func signInUser(email: String, password: String) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }

    @discardableResult
    func signInWithApple(tokens: SignInWithAppleResultModel) async throws -> AuthDataResultModel {
        let credential = OAuthProvider.credential(withProviderID: AuthProviderOprion.apple.rawValue, idToken: tokens.token, rawNonce: tokens.nonce)
        return try await signInWithCredential(credential: credential)
    }
    
    private func signInWithCredential(credential: AuthCredential) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().signIn(with: credential)
        return AuthDataResultModel(user: authDataResult.user)
    }
    
    func resetUserPassword(email: String) async throws {
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
    
    func deleteUser() async throws {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        
        try await user.delete()
    }
}
