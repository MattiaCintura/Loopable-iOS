//
//  SettingsView.swift
//  Loopable
//
//  Created by Mattia Cintura on 23/06/23.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var vm = SettingsViewModel()
    @Binding var showAuthenticationView: Bool

    var body: some View {
        NavigationStack {
            Form {
                Button("Shared.Logout") {
                    do {
                        try vm.logout()
                        showAuthenticationView = true
                    } catch {
                        print("\(error)")
                    }
                }
                .foregroundColor(.red)
            }
            .scrollContentBackground(.hidden)
            .background(
                Color.globalBackground
                    .ignoresSafeArea()
            )
            .navigationTitle("Settings.NavigationTitle")
            .navigationBarTitleDesign(.darkGrey, rounded: true)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(showAuthenticationView: .constant(false))
    }
}
