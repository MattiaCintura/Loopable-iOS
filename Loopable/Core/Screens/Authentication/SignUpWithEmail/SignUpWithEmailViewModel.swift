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
        guard !email.isEmpty, !password.isEmpty else {
            throw AuthenticationError.requiredEmailAndPassword
        }
        
        guard Functionalities.validateEmailAddress(email: email) else {
            throw AuthenticationError.invalidEmail
        }
        
        guard password == confirmPassword else {
            throw AuthenticationError.confirmPassword
        }
        
        try await AuthenticationManager.shared.createUser(email: email, password: password)
    }
    
    func handleFirebaseError(_ error: NSError) {
        if error.code == AuthErrorCode.emailAlreadyInUse.rawValue {
            errorMessage = "Authentication.Error.EmailAlreadyInUse".localized
            hasError = true
        } else if error.code == AuthErrorCode.weakPassword.rawValue {
            errorMessage = "Authentication.Error.WeakPassword".localized
            hasError = true
        }
    }
}
