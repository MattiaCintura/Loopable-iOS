//
//  AuthenticationMainView.swift
//  Loopable
//
//  Created by Mattia Cintura on 06/05/23.
//

import SwiftUI

struct AuthenticationMainView: View {
    @Binding var showAuthenticationView: Bool
    var body: some View {
        NavigationStack {
            VStack {
                Header
                Spacer()
                Spacer()
                Buttons
                Spacer()
            }
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

struct AuthenticationMainView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationMainView(showAuthenticationView: .constant(false))
    }
}

extension AuthenticationMainView {
    private var Header: some View {
        VStack {
            Image("Authentication_Cover")
                .resizable()
                .scaledToFit()

            VStack(spacing: 10) {
                Text("Authentication.Title")
                    .font(.system(.largeTitle, design: .rounded, weight: .bold))

                Text("Authentication.Subtitle")
                    .font(.system(.callout, design: .rounded))
            }
            .foregroundColor(.darkGrey)
        }
        .edgesIgnoringSafeArea(.top)
    }
    
    private var Buttons: some View {
        VStack {
            SignInWithAppleView(showAuthenticationView: $showAuthenticationView)
    
            NavigationLink {
                SignInWithEmailView(showAuthenticationView: $showAuthenticationView)
                    .navigationBarTitleDisplayMode(.large)
            } label: {
                Label("Authentication.SignInWithEmail", systemImage: "envelope")
                    .frame(width: UIScreen.main.bounds.width - 30, height: 50)
                    .font(.system(.headline, design: .rounded))
                    .foregroundColor(.darkGrey)
                    .background(Color.darkGrey25)
                    .cornerRadius(10)
            }
            .padding(.bottom, 10)
            
            NavigationLink {
                SignUpWithEmailView(showAuthenticationView: $showAuthenticationView)
                    .navigationBarTitleDisplayMode(.large)
            } label: {
                Text("Authentication.SignUpWithEmail")
                    .font(.system(.footnote, design: .rounded))
                    .foregroundColor(.darkGrey)
                    .underline()
            }
        }
    }
}
