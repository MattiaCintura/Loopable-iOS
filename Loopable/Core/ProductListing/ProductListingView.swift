//
//  ProductListingView.swift
//  Loopable
//
//  Created by Mattia Cintura on 02/04/23.
//

import SwiftUI

struct ProductListingView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                Photos
                MainInfo
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.accentColor, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationBarBackButtonHidden(false)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "heart")
                        .foregroundColor(.white)
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
        VStack {
            
        }
    }
}
