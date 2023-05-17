//
//  CompleteProfileViewModel.swift
//  Loopable
//
//  Created by Mattia Cintura on 14/05/23.
//

import Foundation

@MainActor
final class CompleteProfileViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var province: ProvinceOfItaly = .agrigento
    
    func completeProfile() async throws {
        guard let user = try? AuthenticationManager.shared.getAuthenticatedUser() else {
            return
        }
        
        var currentUserProfile = try await UserManager.shared.getUserById(userId: user.uid)
        
        currentUserProfile.firstName = firstName
        currentUserProfile.lastName = lastName
        currentUserProfile.province = province
        
        try await UserManager.shared.updateUser(user: currentUserProfile)
    }
}
