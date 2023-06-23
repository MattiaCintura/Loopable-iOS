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
    @Published private(set) var isComplete: Bool = false
    
    func getUserInfo() async throws {
        guard let currentUser = try? AuthenticationManager.shared.getAuthenticatedUser() else {
            return
        }
        
        let userData = try await UserManager.shared.getUserById(userId: currentUser.uid)
        
        self.isComplete = userData.isComplete ?? false

        if let firstName = userData.firstName,
           let lastName = userData.lastName {
            self.username = "\(firstName) \(lastName)"
        } else {
            self.username = userData.email?.components(separatedBy: "@")[0]
        }
    }
}
