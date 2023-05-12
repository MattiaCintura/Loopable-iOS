//
//  Functionalities_Tests.swift
//  Loopable_Tests
//
//  Created by Mattia Cintura on 12/05/23.
//

import XCTest
@testable import Loopable

final class Functionalities_Tests: XCTestCase {
    
    func test_validateEmailAddress_valid() {
        let email = "example@loopable.it"
        
        let result = Functionalities.validateEmailAddress(email: email)
        
        XCTAssertTrue(result)
    }
    
    func test_validateEmailAddress_invalid() {
        let email = "example@loopable."
        
        let result = Functionalities.validateEmailAddress(email: email)
        
        XCTAssertFalse(result)
    }
    
    func test_validateEmailAddress_empty() {
        let email = ""
        
        let result = Functionalities.validateEmailAddress(email: email)
        
        XCTAssertFalse(result)
    }
}
