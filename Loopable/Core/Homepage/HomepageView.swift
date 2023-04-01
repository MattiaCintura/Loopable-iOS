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
                Categories
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
        .padding(.bottom)
    }
    
    private var Categories: some View {
        HStack(spacing: 20) {
            Group {
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 60, height: 60)
                            .foregroundColor(.orange.opacity(0.25))
                        Image(systemName: "hammer.fill")
                            .font(.title2)
                            .foregroundColor(.orange)
                    }
                    Text("Homepage.Categories.DIY")
                        .font(.system(.caption, design: .rounded))
                        .foregroundColor(.darkGrey)
                }
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 60, height: 60)
                            .foregroundColor(.blue.opacity(0.25))
                        Image(systemName: "tent.fill")
                            .font(.title2)
                            .foregroundColor(.blue)
                    }
                    Text("Homepage.Categories.Outdoor")
                        .font(.system(.caption, design: .rounded))
                        .foregroundColor(.darkGrey)
                }
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 60, height: 60)
                            .foregroundColor(.purple.opacity(0.25))
                        Image(systemName: "laptopcomputer")
                            .font(.title2)
                            .foregroundColor(.purple)
                    }
                    Text("Homepage.Categories.Technology")
                        .font(.system(.caption, design: .rounded))
                        .foregroundColor(.darkGrey)
                }
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 60, height: 60)
                            .foregroundColor(.gray.opacity(0.25))
                        Image(systemName: "ellipsis")
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                    Text("Homepage.Categories.Other")
                        .font(.system(.caption, design: .rounded))
                        .foregroundColor(.darkGrey)
                }
            }
            .frame(width: 75)
        }
        .multilineTextAlignment(.center)
        .lineLimit(2, reservesSpace: true)
    }
}
