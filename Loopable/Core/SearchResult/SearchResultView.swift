//
//  SearchResultView.swift
//  Loopable
//
//  Created by Mattia Cintura on 01/04/23.
//

import SwiftUI

struct SearchResultView: View {
    @State var searchQuery: String
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    SearchField
                    Location
                }
                .background(Color.accentColor)
                ResultList
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbarBackground(Color.accentColor, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("Loopable_White_Logo_Full")
                        .resizable()
                        .scaledToFit()
                }
            }
        }
    }
}

struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultView(searchQuery: "")
    }
}

extension SearchResultView {
    private var SearchField: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .frame(height: 50)
                .foregroundColor(Color(UIColor.systemBackground))
                .shadow(color: .darkGrey.opacity(0.25), radius: 4)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.darkGrey)
                TextField("SearchResult.SearchFieldPlaceholder", text: $searchQuery)
                Spacer()
                if !searchQuery.isEmpty {
                    Button {
                        searchQuery = ""
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.darkGrey)
                    }
                }
            }
            .padding()
        }
        .padding(.horizontal)
        .padding(.top)
        .padding(.bottom, 10)
    }
    
    private var Location: some View {
        HStack {
            Label {
                Text("SearchResult.Location \("Verbano-Cusio-Ossola")")
            } icon: {
                Image(systemName: "location.circle.fill")
            }
            .foregroundColor(Color(UIColor.systemBackground))
            .font(.system(.subheadline, design: .rounded, weight: .bold))
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
    
    private var ResultList: some View {
        VStack(spacing: 20) {
            NavigationLink {
                ProductListingView()
                    .toolbar(.hidden, for: .tabBar)
            } label: {
                ZStack(alignment: .top) {
                    // Container
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: .infinity, height: 280)
                        .foregroundColor(Color(UIColor.systemBackground))
                        .shadow(color: .darkGrey.opacity(0.25), radius: 4)
                    
                    // Container
                    VStack(alignment: .leading, spacing: 3) {
                        Image("helmet_mock")
                            .resizable()
                            .scaledToFill()
                            .frame(width: .infinity, height: 170)
                            .cornerRadius(15)
                            .padding(.top, 10)
                            .padding(.bottom, 5)
                            .padding(.horizontal)
                        HStack {
                            Text("Casco da sci")
                                .font(.system(.title, design: .rounded, weight: .bold))
                                .foregroundColor(.darkGrey)
                                .padding(.leading)
                            Spacer()
                            Image(systemName: "heart")
                                .foregroundColor(.darkGrey50)
                                .padding(.trailing)
                        }
                        Text("Verbania (VB)")
                            .font(.system(.headline, design: .rounded))
                            .foregroundColor(.darkGrey25)
                            .padding(.leading)
                        Text("15€ al giorno")
                            .font(.system(.headline, design: .rounded, weight: .semibold))
                            .foregroundColor(.accentColor)
                            .padding(.leading)
                    }
                }
            }

            ZStack(alignment: .top) {
                // Container
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: .infinity, height: 280)
                    .foregroundColor(Color(UIColor.systemBackground))
                    .shadow(color: .darkGrey.opacity(0.25), radius: 4)
                
                // Container
                VStack(alignment: .leading, spacing: 3) {
                    Image("helmet_mock_2")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 170)
                        .cornerRadius(15)
                        .padding(.top, 10)
                        .padding(.bottom, 5)
                        .padding(.horizontal)
                        HStack {
                            Text("Casco da sci")
                                .font(.system(.title, design: .rounded, weight: .bold))
                                .foregroundColor(.darkGrey)
                                .padding(.leading)
                            Spacer()
                            Image(systemName: "heart")
                                .foregroundColor(.darkGrey50)
                                .padding(.trailing)
                        }
                        Text("Pallanza (VB)")
                            .font(.system(.headline, design: .rounded))
                            .foregroundColor(.darkGrey25)
                            .padding(.leading)
                        Text("22€ al giorno")
                            .font(.system(.headline, design: .rounded, weight: .semibold))
                            .foregroundColor(.accentColor)
                            .padding(.leading)
                }
            }
        }
        .padding(.horizontal)
    }
}
