//
//  SignInWithAppleHelper.swift
//  Loopable
//
//  Created by Mattia Cintura on 13/05/23.
//

import Foundation
import AuthenticationServices
import CryptoKit

@MainActor
final class SignInWithAppleHelper: NSObject {
    
    private(set) var currentNonce: String?
    private var complitioHandler: ((Result<SignInWithAppleResult, Error>) -> Void)? = nil
    
    func signInWithAppleFlow() async throws -> SignInWithAppleResult {
        try await withCheckedThrowingContinuation { continuation in
            self.signInWithAppleFlow { result in
                switch result {
                case .success(let signInResult):
                    continuation.resume(returning: signInResult)
                    return
                case .failure(let error):
                    continuation.resume(throwing: error)
                    return
                }
            }
        }
    }
    
    private func signInWithAppleFlow(complition: @escaping (Result<SignInWithAppleResult, Error>) -> Void) {
        guard let topViewController = Functionalities.topViewController() else {
            complition(.failure(AuthenticationError.unableToSignInWithApple))
            return
        }
        
        let nonce = randomNonceString()
        currentNonce = nonce
        complitioHandler = complition
        
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        request.nonce = sha256(nonce)
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = topViewController
        authorizationController.performRequests()
    }
    
    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        var randomBytes = [UInt8](repeating: 0, count: length)
        let errorCode = SecRandomCopyBytes(kSecRandomDefault, randomBytes.count, &randomBytes)
        if errorCode != errSecSuccess {
            fatalError(
                "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
            )
        }
        
        let charset: [Character] =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        
        let nonce = randomBytes.map { byte in
            // Pick a random character from the set, wrapping around if needed.
            charset[Int(byte) % charset.count]
        }
        
        return String(nonce)
    }
    
    @available(iOS 13, *)
    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            String(format: "%02x", $0)
        }.joined()
        
        return hashString
    }
}

extension SignInWithAppleHelper: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        guard
            let appleIDCredentials = authorization.credential as? ASAuthorizationAppleIDCredential,
            let appleIDToken = appleIDCredentials.identityToken,
            let idTokenString = String(data: appleIDToken, encoding: .utf8),
            let nonce = currentNonce else {
            complitioHandler?(.failure(AuthenticationError.unableToSignInWithApple))
            return
        }
        
        let tokens = SignInWithAppleResult(token: idTokenString, nonce: nonce)
        complitioHandler?(.success(tokens))
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        complitioHandler?(.failure(AuthenticationError.unableToSignInWithApple))
        print("Sign in with Apple error: \(error)")
    }
}

extension UIViewController: ASAuthorizationControllerPresentationContextProviding {
    public func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}
