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
            CreateListingView()
                .tabItem {
                    Label("TabBar.CreateListing.Label", systemImage: "plus.square")
                }
            Color.white
                .tabItem {
                    Label("TabBar.Chat.Label", systemImage: "bubble.left.and.bubble.right")
                }
            ProfileView(showAuthenticationView: $showAuthenticationView)
                .tabItem {
                    Label("TabBar.Profile.Label", systemImage: "person.circle")
                }
        }
        .onAppear {
            let currentUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.showAuthenticationView = currentUser == nil
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
