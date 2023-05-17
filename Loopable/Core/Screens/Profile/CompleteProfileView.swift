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
        .navigationTitle("Completa profilo")
        .navigationBarTitleDesign(.darkGrey, rounded: true)
    }
}

struct CompleteProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CompleteProfileView()
        }
    }
}

extension CompleteProfileView {
    private var FirstNameField: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 5) {
                Image(systemName: "person")
                Text("Nome")
            }
            .font(.system(.headline, design: .rounded))
            .foregroundColor(.darkGrey)
            .padding(.leading)
            
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .frame(height: 50)
                    .foregroundColor(Color(UIColor.systemBackground))
                    .shadow(color: .darkGrey.opacity(0.25), radius: 10)
                TextField("Nome", text: $vm.firstName)
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
                Text("Cognome")
            }
            .font(.system(.headline, design: .rounded))
            .foregroundColor(.darkGrey)
            .padding(.leading)
            
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .frame(height: 50)
                    .foregroundColor(Color(UIColor.systemBackground))
                    .shadow(color: .darkGrey.opacity(0.25), radius: 10)
                TextField("Cognome", text: $vm.lastName)
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
                Text("Provincia di residenza")
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
                Text("Scegli provincia")
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
            Text("Aggiorna profilo")
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
            do {
                try await vm.completeProfile()
                self.presentationMode.wrappedValue.dismiss()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
