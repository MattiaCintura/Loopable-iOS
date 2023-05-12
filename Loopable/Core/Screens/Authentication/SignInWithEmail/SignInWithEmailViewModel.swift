//
//  SignInWithEmailViewModel.swift
//  Loopable
//
//  Created by Mattia Cintura on 06/05/23.
//

import Foundation
import FirebaseAuth

@MainActor
final class SignInWithEmailViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""

    @Published var hasError = false
    @Published var errorMessage: String = ""

    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Authentication.Error.EmailAndPasswordRequired".localized
            hasError = true
            throw AuthenticationError.requiredEmailAndPassword
        }
        
        try await AuthenticationManager.shared.signInUser(email: email, password: password)
    }

    func handleFirebaseError(_ error: NSError) {
        switch error.code {
        case AuthErrorCode.wrongPassword.rawValue:
            errorMessage = "Authentication.Error.WrongPassword".localized
            hasError = true
            break
        case AuthErrorCode.userNotFound.rawValue:
            errorMessage = "Authentication.Error.UserNotFound".localized
            hasError = true
            break
        default:
            errorMessage = "Authentication.Error.Generic".localized
            hasError = true
            break
        }
    }
}
