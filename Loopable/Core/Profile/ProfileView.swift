//
//  ProfileView.swift
//  Loopable
//
//  Created by Mattia Cintura on 29/04/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            ProfileInfo
            Divider()
                .foregroundColor(.darkGrey)
            UserFavorites
            UserListing
        }
        .padding([.horizontal, .top], 30)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

extension ProfileView {
    private var ProfileInfo: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Utente")
                    .font(.system(.title, design: .rounded, weight: .bold))
                    .foregroundColor(.darkGrey)

                HStack(spacing: 0) {
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star.leadinghalf.filled")
                    Text("(4.5)")
                }
                .font(.system(.caption, design: .rounded))
                .foregroundColor(.yellow)
                
                Text("3 Annunci pubblicati")
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.lightGrey)

            }
            Spacer()
            ZStack {
                Circle()
                    .frame(width: 80)
                    .foregroundColor(.lightGrey)
                Text("U")
                    .font(.system(.largeTitle, design: .rounded))
            }
        }
    }
    
    private var UserFavorites: some View {
        VStack {
            HStack(spacing: 5) {
                Image(systemName: "heart")
                Text("Preferiti")
                Spacer()
            }
            .font(.system(.headline, design: .rounded))
            .foregroundColor(.darkGrey)

            Text("Non hai annunci preferiti al momento")
                .font(.system(.subheadline, design: .rounded))
                .foregroundColor(.lightGrey)
                .padding(.top,50)
        }
        .padding(.top, 10)
        .padding(.bottom, 50)
    }
    
    private var UserListing: some View {
        VStack {
            HStack(spacing: 5) {
                Image(systemName: "shippingbox")
                Text("I tuoi annunci")
                Spacer()
            }
            .font(.system(.headline, design: .rounded))
            .foregroundColor(.darkGrey)

            Text("Non hai annunci pubblicati al momento")
                .font(.system(.subheadline, design: .rounded))
                .foregroundColor(.lightGrey)
                .padding(.top,50)
        }
        .padding(.top, 10)
        .padding(.bottom, 50)
    }
}
