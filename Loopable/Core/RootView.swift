//
//  ContentView.swift
//  RootView
//
//  Created by Mattia Cintura on 31/03/23.
//

import SwiftUI

struct RootView: View {
    @State private var showAuthenticationView = false

    var body: some View {
        TabView {
            HomepageView()
                .tabItem {
                    Label("TabBar.Homepage.Label", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("TabBar.Profile.Label", systemImage: "person.circle")
                }
            SettingsView(showAuthenticationView: $showAuthenticationView)
                .tabItem {
                    Label("TabBar.Settings.Label", systemImage: "gearshape")
                }
        }
        .onAppear {
            #if !targetEnvironment(simulator)
            let currentUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.showAuthenticationView = currentUser == nil
            #endif
        }
        .fullScreenCover(isPresented: $showAuthenticationView) {
            AuthenticationMainView(showAuthenticationView: $showAuthenticationView)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
