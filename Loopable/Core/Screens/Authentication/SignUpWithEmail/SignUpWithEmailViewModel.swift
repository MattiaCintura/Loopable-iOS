//
//  SignUpWithEmailViewModel.swift
//  Loopable
//
//  Created by Mattia Cintura on 11/05/23.
//

import Foundation
import FirebaseAuth

@MainActor
final class SignUpWithEmailViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""

    @Published var hasError = false
    @Published var errorMessage: String = ""
    
    func signUp() async throws {
        guard !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty else {
            errorMessage = "Authentication.Error.EmailAndPasswordRequired".localized
            hasError = true
            throw AuthenticationError.requiredEmailAndPassword
        }
        
        guard Functionalities.validateEmailAddress(email: email) else {
            errorMessage = "Authentication.Error.EmailBadFormat".localized
            hasError = true
            throw AuthenticationError.invalidEmail
        }
        
        guard password == confirmPassword else {
            errorMessage = "Authentication.Error.PasswordAndConfirmPassword".localized
            hasError = true
            throw AuthenticationError.confirmPassword
        }
        
        try await AuthenticationManager.shared.createUser(email: email, password: password)
    }
    
    func handleFirebaseError(_ error: NSError) {
        switch error.code {
        case AuthErrorCode.emailAlreadyInUse.rawValue:
            errorMessage = "Authentication.Error.EmailAlreadyInUse".localized
            hasError = true
            break
        case AuthErrorCode.weakPassword.rawValue:
            errorMessage = "Authentication.Error.WeakPassword".localized
            hasError = true
            break
        default:
            errorMessage = "Authentication.Error.Generic".localized
            hasError = true
            break
        }
    }
}
