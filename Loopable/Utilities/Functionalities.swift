//
//  Functionalities.swift
//  Loopable
//
//  Created by Mattia Cintura on 10/05/23.
//

import Foundation

class Functionalities {
    static func validateEmailAddress(email: String) -> Bool {
        let emailRegex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}
