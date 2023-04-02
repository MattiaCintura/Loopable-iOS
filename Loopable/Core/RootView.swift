//
//  ContentView.swift
//  RootView
//
//  Created by Mattia Cintura on 31/03/23.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            HomepageView()
                .tabItem {
                    Label("Homepage", systemImage: "house")
                }
            Color.white
                .tabItem {
                    Label("Nuovo annuncio", systemImage: "plus.square")
                }
            Color.white
                .tabItem {
                    Label("Chat", systemImage: "bubble.left.and.bubble.right")
                }
            Color.white
                .tabItem {
                    Label("Profilo", systemImage: "person.circle")
                }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
