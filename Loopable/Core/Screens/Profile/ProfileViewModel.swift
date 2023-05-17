//
//  ProfileViewModel.swift
//  Loopable
//
//  Created by Mattia Cintura on 08/05/23.
//

import Foundation

@MainActor
class ProfileViewModel: ObservableObject {
    @Published private(set) var username: String?
    @Published private(set) var isProfileComplite: Bool = true
    
    func getUserInfo() async throws {
        guard let currentUser = try? AuthenticationManager.shared.getAuthenticatedUser() else {
            return
        }
        
        let userData = try await UserManager.shared.getUserById(userId: currentUser.uid)
        
        self.isProfileComplite = userData.firstName != nil
        
        if let firstName = userData.firstName,
           let lastName = userData.lastName {
            self.username = "\(firstName) \(lastName)"
        }
    }
    
    func logout() throws {
        try AuthenticationManager.shared.signOut()
    }
}
