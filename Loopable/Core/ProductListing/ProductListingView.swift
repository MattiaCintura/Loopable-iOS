//
//  ProductListingView.swift
//  Loopable
//
//  Created by Mattia Cintura on 02/04/23.
//

import SwiftUI

struct ProductListingView: View {
    @State private var isPresented = false

    var body: some View {
        NavigationStack {
            ScrollView {
                Photos
                MainInfo
                Prices
                Divider()
                    .padding(.horizontal)
                MoreInfo
                ConfirmButton
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.accentColor, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "heart")
                        .foregroundColor(.white)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink {
                        SearchResultView(searchQuery: "Casco da sci")
                    } label: {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

struct ProductListingView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListingView()
    }
}


extension ProductListingView {
    private var Photos: some View {
        HStack {
            Image("helmet_mock")
                .resizable()
                .scaledToFit()
        }
    }
    
    private var MainInfo: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Casco da sci")
                    .font(.system(.title, design: .rounded, weight: .bold))
                    .foregroundColor(.darkGrey)
                Label {
                    Text("Verbania (VB)")
                } icon: {
                    Image(systemName: "location.circle.fill")
                }
                .font(.system(.subheadline, design: .rounded, weight: .bold))
                .foregroundColor(.darkGrey25)
            }
            Spacer()
        }
        .padding(.horizontal)
    }
    
    private var Prices: some View {
        HStack(spacing: 10) {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.darkGrey25, lineWidth: 1)
                    .foregroundColor(Color(UIColor.systemBackground))
                VStack(spacing: 10) {
                    Text("Giornaliero")
                        .font(.system(.footnote, design: .rounded))
                        .foregroundColor(.darkGrey50)
                    Text("15€ al giorno")
                        .font(.system(.headline, design: .rounded))
                        .foregroundColor(.accentColor)
                }
            }
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.darkGrey25, lineWidth: 1)
                    .foregroundColor(Color(UIColor.systemBackground))
                VStack(spacing: 10) {
                    Text("3 giorni")
                        .font(.system(.footnote, design: .rounded))
                        .foregroundColor(.darkGrey50)
                    Text("12€ al giorno")
                        .font(.system(.headline, design: .rounded))
                        .foregroundColor(.accentColor)
                }
            }
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.darkGrey25, lineWidth: 1)
                    .foregroundColor(Color(UIColor.systemBackground))
                VStack(spacing: 10) {
                    Text("7 giorni")
                        .font(.system(.footnote, design: .rounded))
                        .foregroundColor(.darkGrey50)
                    Text("10€ al giorno")
                        .font(.system(.headline, design: .rounded))
                        .foregroundColor(.accentColor)
                }
            }
        }
        .frame(height: 80)
        .padding(.horizontal)
    }
    
    private var MoreInfo: some View {
        VStack(spacing: 10) {
            // Title
            HStack {
                Text("Informazioni generali")
                    .font(.system(.title2, design: .rounded, weight: .bold))
                    .foregroundColor(.darkGrey)
                Spacer()
            }
            HStack {
                Text("Anno di acquisto")
                    .font(.system(.caption, design: .rounded))
                    .foregroundColor(.darkGrey50)
                Spacer()
                Text("2021")
                    .font(.system(.caption, design: .rounded))
                    .foregroundColor(.darkGrey)
            }
            HStack {
                Text("Condizioni")
                    .font(.system(.caption, design: .rounded))
                    .foregroundColor(.darkGrey50)
                Spacer()
                Text("Buone")
                    .font(.system(.caption, design: .rounded))
                    .foregroundColor(.darkGrey)
            }
            Divider()
            // Title
            HStack {
                Text("Recensioni")
                    .font(.system(.title2, design: .rounded, weight: .bold))
                    .foregroundColor(.darkGrey)
                Spacer()
            }
            VStack {
                HStack {
                    Text("User12345")
                        .font(.system(.caption, design: .rounded))
                        .foregroundColor(.darkGrey50)
                    Spacer()
                    HStack(spacing: 0) {
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.leadinghalf.filled")
                    }
                    .font(.system(.caption, design: .rounded))
                    .foregroundColor(.yellow)
                }
                HStack {
                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(.darkGrey)
                    Spacer()
                }
            }
            .padding(.bottom)
            VStack {
                HStack {
                    Text("User12345")
                        .font(.system(.caption, design: .rounded))
                        .foregroundColor(.darkGrey50)
                    Spacer()
                    HStack(spacing: 0) {
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.leadinghalf.filled")
                    }
                    .font(.system(.caption, design: .rounded))
                    .foregroundColor(.yellow)
                }
                HStack {
                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(.darkGrey)
                    Spacer()
                }
            }
            .padding(.bottom)
            VStack {
                HStack {
                    Text("User12345")
                        .font(.system(.caption, design: .rounded))
                        .foregroundColor(.darkGrey50)
                    Spacer()
                    HStack(spacing: 0) {
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.leadinghalf.filled")
                    }
                    .font(.system(.caption, design: .rounded))
                    .foregroundColor(.yellow)
                }
                HStack {
                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(.darkGrey)
                    Spacer()
                }
            }
            Divider()
            // Title
            VStack {
                HStack {
                    Text("Proprietario")
                        .font(.system(.title2, design: .rounded, weight: .bold))
                        .foregroundColor(.darkGrey)
                    Spacer()
                }
                HStack {
                    Circle()
                        .frame(width: 50)
                        .foregroundColor(.cyan)
                    VStack {
                        Text("Maurizio")
                            .font(.system(.title2, design: .rounded, weight: .bold))
                            .foregroundColor(.darkGrey)
                    }
                    Spacer()
                }
            }
        }
        .padding(.horizontal)
    }
    
    private var ConfirmButton: some View {
        Button {
            
        } label: {
            Text("Affitta")
                .foregroundColor(.white)
                .frame(height: 55)
                .font(.system(.headline, design: .rounded))
                .padding(.horizontal, 150)
                .background {
                    Color.accentColor
                        .cornerRadius(10)
                }
        }
    }
}
