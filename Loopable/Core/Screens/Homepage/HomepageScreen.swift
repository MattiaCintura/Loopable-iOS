//
//  HomepageScreen.swift
//  Loopable
//
//  Created by Mattia Cintura on 24/06/23.
//

import SwiftUI

struct HomepageScreen: View {
    @State private var searchQuery: String = ""
    @State private var resultList: Array<String> = []
    
    @State private var isSearching = false
    @State private var isLoading = false
    
    private var displayMode: HomepageState {
        if isSearching == true && isLoading == false && resultList.count >= 1 {
            return .result
        } else if isSearching == true && isLoading == true && resultList.isEmpty {
            return .loading
        } else if isSearching == true && isLoading == false && resultList.isEmpty {
            return .noData
        } else {
            return .normal
        }
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                SearchField
                
                switch displayMode {
                case .normal:
                    HomepageView()
                        .transition(.opacity)
                case .loading:
                    SearchLoadingPlaceholderView()
                        .transition(.opacity)
                case .result:
                    ForEach(resultList, id: \.self) { product in
                        
                    }
                    .transition(.opacity)
                case .noData:
                    NoDataPlaceholderView(searchQuery: searchQuery)
                        .transition(.opacity)
                }
            }
            .background(
                Color.globalBackground
                    .ignoresSafeArea()
            )
            .navigationBarTitleDisplayMode(.inline)
            .scrollDismissesKeyboard(.immediately)
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

struct HomepageScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomepageScreen()
    }
}

extension HomepageScreen {
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
                    .submitLabel(.search)
                    .onSubmit {
                        print(searchQuery)
                    }
            }
            .padding()
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
}
