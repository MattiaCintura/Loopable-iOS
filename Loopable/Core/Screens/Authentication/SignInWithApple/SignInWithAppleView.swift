//
//  SignInWithAppleView.swift
//  Loopable
//
//  Created by Mattia Cintura on 13/05/23.
//

import SwiftUI

struct SignInWithAppleView: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var showAuthenticationView: Bool
    @StateObject private var vm = SignInWithAppleViewModel()

    var body: some View {
        Button {
            signInWithAppleAcrion()
        } label: {
            SignInWithAppleViewRepresentable(type: .default, style: colorScheme == .light ? .black : .white)
                .allowsHitTesting(false)
                .frame(width: UIScreen.main.bounds.width - 30, height: 50)
                .cornerRadius(10)
        }
    }
}

struct SignInWithAppleView_Previews: PreviewProvider {
    static var previews: some View {
        SignInWithAppleView(showAuthenticationView: .constant(false))
    }
}

extension SignInWithAppleView {
    private func signInWithAppleAcrion() {
        Task {
            do {
                try await vm.signInWithApple()
                showAuthenticationView = false
            } catch {
                print(error)
            }
        }
    }
}
