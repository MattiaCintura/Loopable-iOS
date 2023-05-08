//
//  ProfileViewModel.swift
//  Loopable
//
//  Created by Mattia Cintura on 08/05/23.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published private(set) var username: String?
    
    func getUserInfo() {
        guard
            let currentUser = try? AuthenticationManager.shared.getAuthenticatedUser(),
            let email = currentUser.email
        else {
            return
        }
        
        self.username = email.components(separatedBy: "@")[0].capitalized
    }
    
    func logout() throws {
        try AuthenticationManager.shared.signOut()
    }
}
