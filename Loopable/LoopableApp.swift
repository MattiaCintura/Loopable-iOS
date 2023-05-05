//
//  LoopableApp.swift
//  Loopable
//
//  Created by Mattia Cintura on 31/03/23.
//

import SwiftUI

@main
struct LoopableApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
