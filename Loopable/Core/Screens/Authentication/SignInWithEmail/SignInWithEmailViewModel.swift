//
//  SignInWithEmailViewModel.swift
//  Loopable
//
//  Created by Mattia Cintura on 06/05/23.
//

import Foundation

@MainActor
final class SignInWithEmailViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    func signUp() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            return
        }
        
        guard Functionalities.validateEmailAddress(email: email) else {
            return
        }
        
        try await AuthenticationManager.shared.createUser(email: email, password: password)
    }
    
    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            return
        }
        
        try await AuthenticationManager.shared.signInUser(email: email, password: password)
    }
}
