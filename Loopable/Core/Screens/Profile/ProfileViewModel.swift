//
//  ProfileViewModel.swift
//  Loopable
//
//  Created by Mattia Cintura on 08/05/23.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published private(set) var username: String?
    @Published private(set) var isProfileComplite: Bool = false
    
    func getUserInfo() async throws {
        guard let currentUser = try? AuthenticationManager.shared.getAuthenticatedUser() else {
            return
        }
        
        let userData = try await UserManager.shared.getUserById(userId: currentUser.uid)
        self.isProfileComplite = userData.firstName != nil
    }
    
    func logout() throws {
        try AuthenticationManager.shared.signOut()
    }
}
