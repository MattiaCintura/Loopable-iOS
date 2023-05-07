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
    
    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            return
        }
        
        try await AuthenticationManager.shared.createUser(email: email, password: password)
    }
}
