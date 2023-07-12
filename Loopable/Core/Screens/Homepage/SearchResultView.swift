//
//  SearchResultView.swift
//  Loopable
//
//  Created by Mattia Cintura on 01/04/23.
//

import SwiftUI

struct SearchResultView: View {
    let resultList: [Product]

    var body: some View {
        VStack(spacing: 20) {
            ForEach(resultList, id: \.id) { product in
                NavigationLink(value: product) {
                    ProductCard(for: product)
                        .onAppear {
                            print("Appeared: ProductCard \(product.id)")
                        }
                }
            }
        }
        .padding(.horizontal)
        .toolbarColorScheme(.none, for: .navigationBar)
        .navigationDestination(for: Product.self) { item in
            ProductListingView(product: item)
        }
    }
}

struct SearchResultView_Previews: PreviewProvider {
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
        NavigationStack {
            SearchResultView(resultList: [mock])
        }
    }
}

extension SearchResultView {
    private func ProductCard(for product: Product) -> some View {
        ZStack(alignment: .top) {
            // Container
            RoundedRectangle(cornerRadius: 15)
                .frame(height: 280)
                .foregroundColor(Color(UIColor.systemBackground))
                .shadow(color: .darkGrey.opacity(0.25), radius: 4)
            
            // Container
            VStack(alignment: .leading, spacing: 3) {
                if let firstImage = product.images.first {
                    AsyncImage(url: URL(string: firstImage)) { image in
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
                    .frame(height: 170)
                    .cornerRadius(15)
                    .padding(.top, 10)
                    .padding(.bottom, 5)
                    .padding(.horizontal)
                }

                HStack {
                    Text(product.name)
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
                Text("\(String(format: "%.0f", product.price))€ al giorno")
                    .font(.system(.headline, design: .rounded, weight: .semibold))
                    .foregroundColor(.accentColor)
                    .padding(.leading)
            }
        }
    }
}
