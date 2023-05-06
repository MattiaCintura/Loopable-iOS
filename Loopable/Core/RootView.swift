//
//  ContentView.swift
//  RootView
//
//  Created by Mattia Cintura on 31/03/23.
//

import SwiftUI

struct RootView: View {
    
    @State private var showAuthenticationView = true
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
            ProfileView()
                .tabItem {
                    Label("TabBar.Profile.Label", systemImage: "person.circle")
                }
        }
        .fullScreenCover(isPresented: $showAuthenticationView) {
            AuthenticationMainView()
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
