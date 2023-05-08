//
//  ProfileView.swift
//  Loopable
//
//  Created by Mattia Cintura on 29/04/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var vm = ProfileViewModel()
    @Binding var showAuthenticationView: Bool

    var body: some View {
        NavigationStack {
            ScrollView {
                ProfileInfo
                Divider()
                    .foregroundColor(.darkGrey)
                UserFavorites
                UserListing
            }
            .padding(.horizontal)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Logout") {
                        do {
                            try vm.logout()
                            showAuthenticationView = true
                        } catch {
                            print("\(error)")
                        }
                    }
                }
            }
        }
        .onAppear {
            vm.getUserInfo()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(showAuthenticationView: .constant(false))
    }
}

extension ProfileView {
    private var ProfileInfo: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(vm.username ?? "Utente")
                    .font(.system(.title, design: .rounded, weight: .bold))
                    .foregroundColor(.darkGrey)

                StarRating(rating: 4.6)
                    .font(.system(.caption, design: .rounded))
                
                Text("Profile.ListingNumber \("3")")
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.lightGrey)

            }
            Spacer()
            ZStack {
                Circle()
                    .frame(width: 80)
                    .foregroundColor(.lightGrey)
                Text(String(vm.username?.first ?? "U"))
                    .font(.system(.largeTitle, design: .rounded))
            }
        }
    }
    
    private var UserFavorites: some View {
        VStack {
            HStack(spacing: 5) {
                Image(systemName: "heart")
                Text("Profile.Favorites")
                Spacer()
            }
            .font(.system(.headline, design: .rounded))
            .foregroundColor(.darkGrey)

            Text("Profile.Favorites.EmptyListPlaceholder")
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
                Text("Profile.YourListings")
                Spacer()
            }
            .font(.system(.headline, design: .rounded))
            .foregroundColor(.darkGrey)

            Text("Profile.YourListings.EmptyListPlaceholder")
                .font(.system(.subheadline, design: .rounded))
                .foregroundColor(.lightGrey)
                .padding(.top,50)
        }
        .padding(.top, 10)
        .padding(.bottom, 50)
    }
}
