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
    @State private var isPasswordVisible = false
    @State private var isLoading = false
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    EmailField
                }
                .padding(.bottom)
                
                VStack(alignment: .leading) {
                    PasswordField
                }
                .padding(.bottom)
                
                
                VStack(alignment: .trailing) {
                    ResetPasswordButton
                    LoginButton
                }
            }
            .padding(.horizontal)
            .padding(.top)
            Spacer()
        }
        .navigationTitle("Authentication.SignInWithEmail")
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

extension SignInWithEmailView {
    private var EmailField: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .frame(height: 50)
                .foregroundColor(Color(UIColor.systemBackground))
                .shadow(color: .darkGrey.opacity(0.25), radius: 10)
            TextField("Authentication.RequiredEmail", text: $vm.email)
                .textInputAutocapitalization(.never)
                .keyboardType(.emailAddress)
                .padding(.horizontal)
                .font(.system(.body, design: .rounded))
        }
    }
    
    private var PasswordField: some View {
        ZStack(alignment: .trailing) {
            RoundedRectangle(cornerRadius: 15)
                .frame(height: 50)
                .foregroundColor(Color(UIColor.systemBackground))
                .shadow(color: .darkGrey.opacity(0.25), radius: 10)
            Group {
                if isPasswordVisible {
                    TextField("Authentication.RequiredPassword", text: $vm.password)
                } else {
                    SecureField("Authentication.RequiredPassword", text: $vm.password)
                }
            }
            .textInputAutocapitalization(.never)
            .keyboardType(.default)
            .padding(.horizontal)
            .font(.system(.body, design: .rounded))
            
            if !vm.password.isEmpty {
                Button {
                    isPasswordVisible.toggle()
                } label: {
                    Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                        .padding(.trailing)
                        .foregroundColor(.darkGrey)
                        .animation(.some(.easeInOut), value: isPasswordVisible)
                }
            }
        }
    }
    
    private var ResetPasswordButton: some View {
        NavigationLink {
            ResetPasswordView()
        } label: {
            Text("Authentication.ForgotPassword")
                .font(.system(.footnote, design: .rounded))
                .foregroundColor(.accentColor)
                .underline()
                .padding(.trailing, 5)
        }
    }
    
    private var LoginButton: some View {
        Button {
            loginAction()
        } label: {
            Group {
                if isLoading {
                    ProgressView()
                        .foregroundColor(.white)
                } else {
                    Text("Authentication.Login")
                }
            }
            .frame(width: UIScreen.main.bounds.width - 30, height: 55)
            .font(.system(.headline, design: .rounded))
            .foregroundColor(Color(UIColor.systemBackground))
            .background(Color.accentColor)
            .cornerRadius(10)
        }
        .disabled(vm.email.isEmpty || vm.password.isEmpty)
    }

    private func loginAction() {
        Task {
            isLoading = true
            do {
                try await vm.signUp()
                showAuthenticationView = false
                return
            } catch {
                print("\(error)")
            }
            
            do {
                try await vm.signIn()
                showAuthenticationView = false
                return
            } catch {
                print("\(error)")
            }
            isLoading = false
        }

    }
    
    public func FieldValidationError(error message: LocalizedStringKey) -> some View {
        Text(message)
            .font(.system(.footnote, design: .rounded))
            .foregroundColor(.red)
            .padding(.horizontal, 5)
    }
}
