//
//  ProductListingView.swift
//  Loopable
//
//  Created by Mattia Cintura on 02/04/23.
//

import SwiftUI

struct ProductListingView: View {
    var product: Product
    @State private var isPresented = false

    var body: some View {
        ScrollView {
            Photos
            MainInfo
            Prices
            Divider()
                .padding(.horizontal)
            GeneralInfo
            Reviews
            Owner
            ConfirmButton
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color.accentColor, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbar(.hidden, for: .tabBar)
        .background(
            Color.globalBackground
                .ignoresSafeArea()
        )
    }
}

struct ProductListingView_Previews: PreviewProvider {
    static var previews: some View {
        let mock: Product = .init(
            id: 1,
            name: "Mountain Bike",
            description: "Una mountain bike ad alte prestazioni per avventure fuoristrada.",
            owner: "Avventura Bici",
            price: 30.0,
            category: .outdoorActivities,
            images: ["https://picsum.photos/800", "https://picsum.photos/700"],
            createdAt: .now,
            updatedAt: .now
        )
        
        ProductListingView(product: mock)
    }
}


extension ProductListingView {
    private var Photos: some View {
        TabView {
            ForEach(product.images, id: \.self) { photoUrl in
                AsyncImage(url: URL(string: photoUrl)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.gray)
                        ProgressView()
                    }
                }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .frame(height: 250)
    }
    
    private var Prices: some View {
        HStack(spacing: 10) {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.darkGrey25, lineWidth: 1)
                    .foregroundColor(Color(UIColor.systemBackground))
                VStack(spacing: 10) {
                    Text("ProductListing.Prices.OneDay")
                        .font(.system(.footnote, design: .rounded))
                        .foregroundColor(.darkGrey50)
                    Text("\(String(format: "%.2f", product.price))€")
                        .font(.system(.headline, design: .rounded))
                        .foregroundColor(.accentColor)
                }
            }
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.darkGrey25, lineWidth: 1)
                    .foregroundColor(Color(UIColor.systemBackground))
                VStack(spacing: 10) {
                    Text("ProductListing.Prices.ThreeDays")
                        .font(.system(.footnote, design: .rounded))
                        .foregroundColor(.darkGrey50)
                    Text("\(String(format: "%.2f", product.price * 3))€")
                        .font(.system(.headline, design: .rounded))
                        .foregroundColor(.accentColor)
                }
            }
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.darkGrey25, lineWidth: 1)
                    .foregroundColor(Color(UIColor.systemBackground))
                VStack(spacing: 10) {
                    Text("ProductListing.Prices.SevenDays")
                        .font(.system(.footnote, design: .rounded))
                        .foregroundColor(.darkGrey50)
                    Text("\(String(format: "%.2f", product.price * 7))€")
                        .font(.system(.headline, design: .rounded))
                        .foregroundColor(.accentColor)
                }
            }
        }
        .frame(height: 80)
        .padding(.horizontal)
    }

    private var MainInfo: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(product.name)
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
    
    private var GeneralInfo: some View {
        VStack(spacing: 10) {
            // Title
            HStack {
                Text("Informazioni generali")
                    .font(.system(.title2, design: .rounded, weight: .bold))
                    .foregroundColor(.darkGrey)
                Spacer()
            }
            HStack {
                Text(product.description)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.darkGrey)
                Spacer()
            }
            Divider()
        }
        .padding(.horizontal)
    }
    
    private var Reviews: some View {
        VStack(spacing: 10) {
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
        }
        .padding(.horizontal)
    }
    
    private var Owner: some View {
        VStack(spacing: 20) {
            // Title
            VStack {
                HStack {
                    Circle()
                        .frame(width: 50)
                        .foregroundColor(.cyan)
                    VStack {
                        Text(product.owner)
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
            isPresented = true
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
