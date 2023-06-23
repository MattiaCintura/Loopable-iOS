//
//  HomepageView.swift
//  Loopable
//
//  Created by Mattia Cintura on 31/03/23.
//

import SwiftUI

struct HomepageView: View {
    @State private var searchQuery: String = ""
    @State private var showProgressWidget = true

    var body: some View {
        NavigationStack {
            ScrollView {
                SearchField
                if showProgressWidget {
                    ProgressWidget(showProgressWidget: $showProgressWidget)
                }
                Categories
                NearYou
                Highlight
                Spacer()
            }
            .background(
                Color.globalBackground
                    .ignoresSafeArea()
            )
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
                NavigationLink {
                    SearchResultView(searchQuery: searchQuery)
                } label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.darkGrey)
                }

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
    
    private var NearYou: some View {
        VStack {
            HStack {
                Text("Homepage.NearYou")
                    .font(.system(.title, design: .rounded, weight: .bold))
                    .foregroundColor(.darkGrey)
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ZStack(alignment: .top) {
                        // Container
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 140, height: 160)
                            .foregroundColor(Color(UIColor.systemBackground))
                            .shadow(color: .darkGrey.opacity(0.25), radius: 4)
                        
                        // Container
                        VStack(alignment: .leading, spacing: 3) {
                            Image("helmet_mock")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 115, height: 70)
                                .cornerRadius(15)
                                .padding(.top, 10)
                                .padding(.bottom, 5)
                            
                            Group {
                                Text("Casco da sci")
                                    .font(.system(.headline, design: .rounded, weight: .bold))
                                    .foregroundColor(.darkGrey)
                                Text("Verbania (VB)")
                                    .font(.system(.subheadline, design: .rounded))
                                    .foregroundColor(.darkGrey25)
                                Text("15€ al giorno")
                                    .font(.system(.subheadline, design: .rounded, weight: .semibold))
                                    .foregroundColor(.accentColor)
                            }
                            .padding(.leading, 5)
                        }
                    }
                    ZStack(alignment: .top) {
                        // Container
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 140, height: 160)
                            .foregroundColor(Color(UIColor.systemBackground))
                            .shadow(color: .darkGrey.opacity(0.25), radius: 4)
                        
                        // Container
                        VStack(alignment: .leading, spacing: 3) {
                            Image("bike_mock")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 115, height: 70)
                                .cornerRadius(15)
                                .padding(.top, 10)
                                .padding(.bottom, 5)
                            
                            Group {
                                Text("Bici da corsa")
                                    .font(.system(.headline, design: .rounded, weight: .bold))
                                    .foregroundColor(.darkGrey)
                                Text("Intra (VB)")
                                    .font(.system(.subheadline, design: .rounded))
                                    .foregroundColor(.darkGrey25)
                                Text("30€ al giorno")
                                    .font(.system(.subheadline, design: .rounded, weight: .semibold))
                                    .foregroundColor(.accentColor)
                            }
                            .padding(.leading, 5)
                        }
                    }
                    ZStack(alignment: .top) {
                        // Container
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 140, height: 160)
                            .foregroundColor(Color(UIColor.systemBackground))
                            .shadow(color: .darkGrey.opacity(0.25), radius: 4)
                        
                        // Container
                        VStack(alignment: .leading, spacing: 3) {
                            Image("drill_mock")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 115, height: 70)
                                .cornerRadius(15)
                                .padding(.top, 10)
                                .padding(.bottom, 5)
                            
                            Group {
                                Text("Trapano")
                                    .font(.system(.headline, design: .rounded, weight: .bold))
                                    .foregroundColor(.darkGrey)
                                Text("Pallanza (VB)")
                                    .font(.system(.subheadline, design: .rounded))
                                    .foregroundColor(.darkGrey25)
                                Text("5€ al giorno")
                                    .font(.system(.subheadline, design: .rounded, weight: .semibold))
                                    .foregroundColor(.accentColor)
                            }
                            .padding(.leading, 5)
                        }
                    }
                }
                .padding(.horizontal ,20)
                .padding(.vertical, 10)
            }
        }
    }
    
    private var Highlight: some View {
        VStack {
            HStack {
                Text("Homepage.Highlight")
                    .font(.system(.title, design: .rounded, weight: .bold))
                    .foregroundColor(.darkGrey)
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 5)
            
            HStack {
                HStack {
                    Image("Homepage_Adv")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                    
                    Text("Scopri come Loopable\n aiuta il pianeta 🌿")
                        .font(.subheadline)
                        .foregroundColor(.darkGrey)
                }
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.accentColor.opacity(0.25), lineWidth: 4)
                        .frame(width: 290, height: 125)
                        .foregroundColor(Color(UIColor.systemBackground))
                )
                .padding(.horizontal)
                .padding(.top)

                Spacer()
            }
            .padding(.horizontal)
        }
    }
}
