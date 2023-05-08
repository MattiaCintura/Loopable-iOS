//
//  StarRating.swift
//  Loopable
//
//  Created by Mattia Cintura on 08/05/23.
//

import SwiftUI

struct StarRating: View {
    var rating: Double
    
    var body: some View {
        ZStack {
            Stars
                .overlay(StarsMask.mask(Stars))
        }
    }
}

struct StarRating_Previews: PreviewProvider {
    static var previews: some View {
        StarRating(rating: 4)
    }
}

extension StarRating {
    private var Stars: some View {
        HStack(spacing: 2) {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .foregroundColor(.lightGrey)
            }
        }
    }
    
    private var StarsMask: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.yellow)
                    .frame(width: CGFloat(rating) / 5 * geometry.size.width)
            }
        }
    }
}
