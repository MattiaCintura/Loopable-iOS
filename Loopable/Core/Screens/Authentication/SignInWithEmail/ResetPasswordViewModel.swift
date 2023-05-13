//
//  ResetPasswordViewModel.swift
//  Loopable
//
//  Created by Mattia Cintura on 10/05/23.
//

import Foundation
import FirebaseAuth

@MainActor
final class ResetPasswordViewModel: ObservableObject {
    @Published var email: String = ""
    
    @Published var hasError = false
    @Published var errorMessage: String = ""
    
    func resetPassword() async throws {
        guard !email.isEmpty else {
            errorMessage = "Authentication.Error.RequiredEmail".localized
            hasError = true
            throw AuthenticationError.requiredEmail
        }
        
        guard Functionalities.validateEmailAddress(email: email) else {
            errorMessage = "Authentication.Error.EmailBadFormat".localized
            hasError = true
            throw AuthenticationError.invalidEmail
        }

        try await AuthenticationManager.shared.resetUserPassword(email: email)
    }
    
    func handleFirebaseError(_ error: NSError) {
        switch error.code {
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
