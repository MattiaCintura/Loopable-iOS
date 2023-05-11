//
//  SignUpWithEmailView.swift
//  Loopable
//
//  Created by Mattia Cintura on 11/05/23.
//

import SwiftUI

struct SignUpWithEmailView: View {
    @Binding var showAuthenticationView: Bool
    @StateObject private var vm = SignUpWithEmailViewModel()
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
                .padding(.bottom, 22)
                
                VStack(alignment: .leading) {
                    ConfirmPasswordField
                }
                .padding(.bottom)
                
                VStack {
                    RegisterButton
                }
            }
            .padding(.horizontal)
            .padding(.top)
            Spacer()
        }
        .navigationTitle("Authentication.SignUpWithEmail")
        .navigationBarTitleDesign(.darkGrey, rounded: true)
        .alert(vm.errorMessage, isPresented: $vm.hasError) {}
    }
}

struct SignUpWithEmailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignUpWithEmailView(showAuthenticationView: .constant(false))
        }
    }
}

extension SignUpWithEmailView {
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

            SecureField("Authentication.RequiredPassword", text: $vm.password)
                .textInputAutocapitalization(.never)
                .keyboardType(.default)
                .padding(.horizontal)
                .font(.system(.body, design: .rounded))
        }
    }
    
    private var ConfirmPasswordField: some View {
        ZStack(alignment: .trailing) {
            RoundedRectangle(cornerRadius: 15)
                .frame(height: 50)
                .foregroundColor(Color(UIColor.systemBackground))
                .shadow(color: .darkGrey.opacity(0.25), radius: 10)

            SecureField("Authentication.RequiredConfirmPassword", text: $vm.confirmPassword)
                .textInputAutocapitalization(.never)
                .keyboardType(.default)
                .padding(.horizontal)
                .font(.system(.body, design: .rounded))
            
            if !vm.confirmPassword.isEmpty {
                Image(systemName: vm.password == vm.confirmPassword ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .padding(.trailing)
                    .foregroundColor(vm.password == vm.confirmPassword ? .green : .red)
            }
        }
    }
    
    private var RegisterButton: some View {
        Button {
            registerAction()
        } label: {
            Group {
                if isLoading {
                    ProgressView()
                        .foregroundColor(.white)
                } else {
                    Text("Authentication.Register")
                }
            }
            .frame(width: UIScreen.main.bounds.width - 30, height: 55)
            .font(.system(.headline, design: .rounded))
            .foregroundColor(Color(UIColor.systemBackground))
            .background(Color.accentColor)
            .cornerRadius(10)
        }
        .disabled(
            vm.email.isEmpty ||
            vm.password.isEmpty ||
            vm.confirmPassword.isEmpty ||
            vm.password != vm.confirmPassword
        )
    }

    private func registerAction() {
        Task {
            isLoading = true
            do {
                try await vm.signUp()
                showAuthenticationView = false
            } catch {
                vm.handleFirebaseError(error as NSError)
            }
            isLoading = false
        }
    }
}
