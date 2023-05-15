//
//  CompleteProfileView.swift
//  Loopable
//
//  Created by Mattia Cintura on 14/05/23.
//

import SwiftUI

struct CompleteProfileView: View {
    @StateObject private var vm = CompleteProfileViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                FirstNameField
            }
            .padding(.top)
        }
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
}
