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
    
    func signIn() {
        guard !email.isEmpty, !password.isEmpty else {
            return
        }
        
        Task {
            do {
                try await AuthenticationManager.shared.createUser(email: email, password: password)
                print("Seccess")
            } catch {
                print("Sign in with email error \(error)")
            }
        }
    }
}
