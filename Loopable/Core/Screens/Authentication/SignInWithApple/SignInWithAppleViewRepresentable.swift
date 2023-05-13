//
//  SignInWithAppleViewRepresentable.swift
//  Loopable
//
//  Created by Mattia Cintura on 13/05/23.
//

import SwiftUI
import AuthenticationServices

struct SignInWithAppleViewRepresentable: UIViewRepresentable {
    
    let type: ASAuthorizationAppleIDButton.ButtonType
    let style: ASAuthorizationAppleIDButton.Style
    
    func makeUIView(context: Context) -> some ASAuthorizationAppleIDButton {
        ASAuthorizationAppleIDButton(authorizationButtonType: type, authorizationButtonStyle: style)
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) { }
}
