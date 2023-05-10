//
//  ResetPasswordViewModel.swift
//  Loopable
//
//  Created by Mattia Cintura on 10/05/23.
//

import Foundation

@MainActor
final class ResetPasswordViewModel: ObservableObject {
    @Published var email: String = ""
    
    func resetPassword() async throws {
        guard !email.isEmpty else {
            return
        }
        
        guard Functionalities.validateEmailAddress(email: email) else {
            return
        }

        try await AuthenticationManager.shared.resetUserPassword(email: email)
    }
}
