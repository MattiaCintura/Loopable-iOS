//
//  SignInWithAppleViewModel.swift
//  Loopable
//
//  Created by Mattia Cintura on 13/05/23.
//

import Foundation

@MainActor
final class SignInWithAppleViewModel: ObservableObject {
    
    func signInWithApple() async throws {
        let helper = SignInWithAppleHelper()
        let tokens = try await helper.signInWithAppleFlow()
        let authDataResult = try await AuthenticationManager.shared.signInWithApple(tokens: tokens)
        let user = UserModel(auth: authDataResult)
        try await UserManager.shared.addUserToCollection(user: user)
    }
}
