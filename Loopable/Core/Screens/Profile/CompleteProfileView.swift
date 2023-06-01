//
//  CompleteProfileView.swift
//  Loopable
//
//  Created by Mattia Cintura on 14/05/23.
//

import SwiftUI

struct CompleteProfileView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject private var vm = CompleteProfileViewModel()
    @Binding var didNavigateBack: Bool
    @State private var isLoading = false

    var body: some View {
        VStack(spacing: 20) {
            FirstNameField
            LastNameField
            Province
            Spacer()
            UpdateButton
                .padding(.bottom)
        }
        .padding(.top)
        .navigationTitle("Profile.CompleteProfile.Title")
        .navigationBarTitleDesign(.darkGrey, rounded: true)
    }
}

struct CompleteProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CompleteProfileView(didNavigateBack: .constant(false))
        }
    }
}

extension CompleteProfileView {
    private var FirstNameField: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 5) {
                Image(systemName: "person")
                Text("Profile.CompleteProfile.FirstName")
            }
            .font(.system(.headline, design: .rounded))
            .foregroundColor(.darkGrey)
            .padding(.leading)
            
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .frame(height: 50)
                    .foregroundColor(Color(UIColor.systemBackground))
                    .shadow(color: .darkGrey.opacity(0.25), radius: 10)
                TextField("Profile.CompleteProfile.FirstName", text: $vm.firstName)
                    .padding(.horizontal)
                    .font(.system(.body, design: .rounded))
            }
            .padding(.horizontal)
        }

    }
    
    private var LastNameField: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 5) {
                Image(systemName: "person")
                Text("Profile.CompleteProfile.LastName")
            }
            .font(.system(.headline, design: .rounded))
            .foregroundColor(.darkGrey)
            .padding(.leading)
            
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .frame(height: 50)
                    .foregroundColor(Color(UIColor.systemBackground))
                    .shadow(color: .darkGrey.opacity(0.25), radius: 10)
                TextField("Profile.CompleteProfile.LastName", text: $vm.lastName)
                    .padding(.horizontal)
                    .font(.system(.body, design: .rounded))
            }
            .padding(.horizontal)
        }

    }
    
    private var Province: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 5) {
                Image(systemName: "location.circle.fill")
                Text("Profile.CompleteProfile.Province")
            }
            .font(.system(.headline, design: .rounded))
            .foregroundColor(.darkGrey)
            .padding(.leading)
            
            ZStack(alignment: .leading) {
                ZStack(alignment: .trailing) {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(height: 50)
                        .foregroundColor(Color(UIColor.systemBackground))
                        .shadow(color: .darkGrey.opacity(0.25), radius: 10)
                    
                    Picker(selection: $vm.province) {
                        ForEach(ProvinceOfItaly.allCases, id: \.self) { province in
                            Text(province.rawValue)
                                .tag(province)
                        }
                    } label: {
                        
                    }
                    .tint(.darkGrey)
                }
                Text("Profile.CompleteProfile.Province.Placeholder")
                    .padding(.horizontal)
                    .font(.system(.body, design: .rounded))
                    .foregroundColor(.gray.opacity(0.5))
            }
            .padding(.horizontal)
        }
    }
    
    private var UpdateButton: some View {
        Button {
            updateProfileAction()
        } label: {
            Group {
                if isLoading {
                    ProgressView()
                        .foregroundColor(.white)
                } else {
                    Text("Profile.CompleteProfile.UpdateProfile")
                }
            }
            .frame(width: UIScreen.main.bounds.width - 30, height: 55)
            .font(.system(.headline, design: .rounded))
            .foregroundColor(.white)
            .background(Color.accentColor)
            .cornerRadius(10)
        }
        .disabled(vm.firstName.isEmpty || vm.lastName.isEmpty)

    }
    
    private func updateProfileAction() {
        Task {
            isLoading = true
            do {
                try await vm.completeProfile()
                self.didNavigateBack = true
                self.presentationMode.wrappedValue.dismiss()
            } catch {
                print(error.localizedDescription)
            }
            isLoading = false
        }
    }
}
