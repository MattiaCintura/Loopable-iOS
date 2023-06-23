//
//  SettingsViewModel.swift
//  Loopable
//
//  Created by Mattia Cintura on 23/06/23.
//

import Foundation

final class SettingsViewModel: ObservableObject {
    
    func logout() throws -> Void {
        try AuthenticationManager.shared.signOut()
    }
}
