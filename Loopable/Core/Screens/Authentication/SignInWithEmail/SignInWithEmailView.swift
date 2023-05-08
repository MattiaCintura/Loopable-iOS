//
//  SignInWithEmailView.swift
//  Loopable
//
//  Created by Mattia Cintura on 06/05/23.
//

import SwiftUI

struct SignInWithEmailView: View {
    @Binding var showAuthenticationView: Bool
    @StateObject private var vm = SignInWithEmailViewModel()
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 30) {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .shadow(color: .darkGrey.opacity(0.25), radius: 10)
                    TextField("Email*", text: $vm.email)
                        .keyboardType(.emailAddress)
                        .padding(.horizontal)
                        .font(.system(.body, design: .rounded))
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .shadow(color: .darkGrey.opacity(0.25), radius: 10)
                    SecureField("Password*", text: $vm.password)
                        .keyboardType(.default)
                        .padding(.horizontal)
                        .font(.system(.body, design: .rounded))
                }
                
                Button("Accedi") {
                    Task {
                        do {
                            try await vm.signIn()
                            showAuthenticationView = false
                        } catch {
                            print("\(error)")
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width - 30, height: 55)
                .font(.system(.headline, design: .rounded))
                .foregroundColor(Color(UIColor.systemBackground))
                .background(Color.accentColor)
                .cornerRadius(10)
                .disabled(vm.email.isEmpty || vm.password.isEmpty)
            }
            .padding(.horizontal)
            .padding(.top)
            Spacer()
        }
        .navigationTitle("Accedi con email")
        .navigationBarTitleDesign(.darkGrey, rounded: true)
    }
}

struct SignInWithEmailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignInWithEmailView(showAuthenticationView: .constant(false))
        }
    }
}
