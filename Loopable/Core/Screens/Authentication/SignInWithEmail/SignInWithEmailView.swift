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
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 30) {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(height: 50)
                        .foregroundColor(Color(UIColor.systemBackground))
                        .shadow(color: .darkGrey.opacity(0.25), radius: 10)
                    TextField("Authentication.RequiredEmail", text: $vm.email)
                        .keyboardType(.emailAddress)
                        .padding(.horizontal)
                        .font(.system(.body, design: .rounded))
                }
                
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
                    .keyboardType(.default)
                    .padding(.horizontal)
                    .font(.system(.body, design: .rounded))
                    
                    Button {
                        isPasswordVisible.toggle()
                    } label: {
                        Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                            .padding(.trailing)
                            .foregroundColor(.darkGrey)
                            .animation(.some(.easeInOut), value: isPasswordVisible)
                    }
                }
                
                Button("Authentication.Login") {
                    Task {
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
