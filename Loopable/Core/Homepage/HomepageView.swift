//
//  HomepageView.swift
//  Loopable
//
//  Created by Mattia Cintura on 31/03/23.
//

import SwiftUI

struct HomepageView: View {
    @State private var searchQuery: String = ""

    var body: some View {
        NavigationStack {
            VStack {
                SearchField
                Spacer()
            }
            .padding(3)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("Loopable_Green_Logo_Full")
                        .resizable()
                        .scaledToFit()
                }
            }
        }
    }
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView()
    }
}

extension HomepageView {
    private var SearchField: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .frame(height: 50)
                .foregroundColor(Color(UIColor.systemBackground))
                .shadow(color: .darkGrey.opacity(0.25), radius: 4)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.darkGrey)
                TextField("Homepage.SearchFieldPlaceholder", text: $searchQuery)
            }
            .padding()
        }
        .padding(.horizontal)
    }
}
