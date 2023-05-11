//
//  Enums.swift
//  Loopable
//
//  Created by Mattia Cintura on 01/04/23.
//

import Foundation

// MARK: Error Enums
enum AuthenticationError: Error {
    case requiredEmail
    case requiredPassword
    case requiredEmailAndPassword
    case invalidEmail
    case weakPassword
    case confirmPassword
}
