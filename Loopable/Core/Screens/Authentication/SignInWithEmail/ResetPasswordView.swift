//
//  ResetPasswordView.swift
//  Loopable
//
//  Created by Mattia Cintura on 10/05/23.
//

import SwiftUI

struct ResetPasswordView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject private var vm = ResetPasswordViewModel()
    @State private var showSuccessAlert = false
    @State private var isLoading = false

    var body: some View {
        VStack {
            Text("Authentication.ResetPassword.Description")
                .multilineTextAlignment(.center)
                .font(.system(.callout, design: .rounded))
                .foregroundColor(.darkGrey50)
                .padding(.horizontal)
                .padding(.top)

            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    EmailField
                }
                .padding(.bottom)
                
                ResetButton
            }
            .padding(.horizontal)
            .padding(.top)
            Spacer()
        }
        .navigationTitle("Authentication.ResetPassword.Title")
        .navigationBarTitleDesign(.darkGrey, rounded: true)
        .alert("Authentication.ResetPassword.Alert", isPresented: $showSuccessAlert) {
            Button("Shared.OK") {
                // Go back to previous view
                self.presentationMode.wrappedValue.dismiss()
            }
        }
        .alert(vm.errorMessage, isPresented: $vm.hasError) {}
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ResetPasswordView()
        }
    }
}

extension ResetPasswordView {
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
    
    private var ResetButton: some View {
        Button {
            resetButtonAction()
        } label: {
            Group {
                if isLoading {
                    ProgressView()
                        .foregroundColor(.white)
                } else {
                    Text("Authentication.ResetPassword.Title")
                }
            }
            .frame(width: UIScreen.main.bounds.width - 30, height: 55)
            .font(.system(.headline, design: .rounded))
            .foregroundColor(Color(UIColor.systemBackground))
            .background(Color.accentColor)
            .cornerRadius(10)
        }
        .disabled(vm.email.isEmpty)
    }
    
    private func resetButtonAction() {
        Task {
            isLoading = true
            do {
                try await vm.resetPassword()
                showSuccessAlert = true
            } catch {
                print("\(error)")
            }
            isLoading = false
        }
    }
}
