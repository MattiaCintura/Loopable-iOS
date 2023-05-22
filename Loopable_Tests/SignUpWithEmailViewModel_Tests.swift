//
//  SignUpWithEmailViewModel_Tests.swift
//  Loopable_Tests
//
//  Created by Mattia Cintura on 12/05/23.
//

import XCTest
@testable import Loopable

@MainActor
final class SignUpWithEmailViewModel_Tests: XCTestCase {

    func test_signUp_allPropertiesEmpty() async {
        let vm = SignUpWithEmailViewModel()

        do {
            try await vm.signUp()
        } catch {
            XCTAssertEqual(error as? AuthenticationError, .requiredEmailAndPassword)
        }
    }

    func test_signUp_invalidEmail() async {
        let vm = SignUpWithEmailViewModel()
        
        vm.email = "example@loopable."
        vm.password = "Test123"
        vm.confirmPassword = "Test123"
        
        do {
            try await vm.signUp()
        } catch {
            XCTAssertEqual(error as? AuthenticationError, .invalidEmail)
        }
    }
    
    func test_signUp_confirmPasswordNotEqual() async {
        let vm = SignUpWithEmailViewModel()
        
        vm.email = "example@loopable.it"
        vm.password = "Test123"
        vm.confirmPassword = "Test1234"
        
        do {
            try await vm.signUp()
        } catch {
            XCTAssertEqual(error as? AuthenticationError, .confirmPassword)
        }
    }
}
