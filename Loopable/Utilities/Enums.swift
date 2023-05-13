//
//  Enums.swift
//  Loopable
//
//  Created by Mattia Cintura on 01/04/23.
//

import Foundation

enum AuthProviderOprion: String {
    case password = "password"
    case apple = "apple.com"
}

// MARK: Error Enums
enum AuthenticationError: Error {
    case requiredEmail
    case requiredPassword
    case requiredEmailAndPassword
    case invalidEmail
    case weakPassword
    case confirmPassword
    case unableToSignInWithApple
}
