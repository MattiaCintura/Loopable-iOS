//
//  ContentView.swift
//  RootView
//
//  Created by Mattia Cintura on 31/03/23.
//

import SwiftUI
import AshComponents

struct RootView: View {
    @State private var tabSelection: TabBarItem = TabBarItem(iconName: "house", title: "Homepage", color: .accentColor)

    var body: some View {
        AshFloatingTabBarContainerView(selection: $tabSelection) {
            HomepageView()
                .customTabBarItem(tab: TabBarItem(iconName: "house", title: "Homepage", color: .accentColor), selection: $tabSelection)
            Color.white
                .customTabBarItem(tab: TabBarItem(iconName: "plus.square", title: "Nuovo annuncio", color: .accentColor), selection: $tabSelection)
            Color.white
                .customTabBarItem(tab: TabBarItem(iconName: "bubble.left.and.bubble.right", title: "Chat", color: .accentColor), selection: $tabSelection)
            Color.white
                .customTabBarItem(tab: TabBarItem(iconName: "person.circle", title: "Profilo", color: .accentColor), selection: $tabSelection)
            
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
