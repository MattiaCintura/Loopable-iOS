//
//  Extentions.swift
//  Loopable
//
//  Created by Mattia Cintura on 01/04/23.
//

import Foundation
import SwiftUI
import UIKit

extension Color {
    static let darkGrey = Color("DarkGrey")
    static let lightGrey = Color("LightGrey")
    static let darkGrey25 = Color("DarkGrey").opacity(0.25)
    static let darkGrey50 = Color("DarkGrey").opacity(0.50)
}

internal extension UIFont {
    @available(iOS 13, *)
    class func rounded(ofSize size: CGFloat, weight: UIFont.Weight) -> UIFont {
        let systemFont = UIFont.systemFont(ofSize: size, weight: weight)

        guard let descriptor = systemFont.fontDescriptor.withDesign(.rounded) else { return systemFont }
        return UIFont(descriptor: descriptor, size: size)
    }
}


extension View {
    /// Sets the text color and rounded design for a navigation bar title.
    /// - Parameter color: Color the title should be
    /// - Parameter rounded: Use rounded design
    ///
    /// Supports both regular and large titles.
    @available(iOS 14, *)
    func navigationBarTitleDesign(_ color: Color, rounded: Bool) -> some View {
        let uiColor = UIColor(color)

        if rounded {
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: uiColor, .font: UIFont.rounded(ofSize: 15, weight: .bold)]
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: uiColor, .font: UIFont.rounded(ofSize: 35, weight: .bold)]
            return self
        }
        
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: uiColor]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: uiColor]
        
        return self
    }
}
