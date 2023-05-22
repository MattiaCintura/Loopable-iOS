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
                if !vm.isComplete {
                    CompleteProfile                    
                }
                Divider()
                    .foregroundColor(.darkGrey)
                UserFavorites
                UserListing
            }
            .padding(.horizontal)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Shared.Logout") {
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
            Task {
                do {
                    try await vm.getUserInfo()
                } catch {
                    print(error)
                }
            }
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
                Text(vm.username ?? "Username")
                    .font(.system(.title, design: .rounded, weight: .bold))
                    .foregroundColor(.darkGrey)
                    .redacted(if: vm.username == nil)

                if vm.isComplete {
                    StarRating(rating: 4.6)
                        .font(.system(.caption, design: .rounded))
                    
                    Text("Profile.ListingNumber \("3")")
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(.lightGrey)
                } else {
                    Spacer()
                }
            }
            Spacer()
            ZStack {
                Circle()
                    .frame(width: 80)
                    .foregroundColor(.lightGrey)
                Text(String(vm.username?.first ?? "U"))
                    .font(.system(.largeTitle, design: .rounded, weight: .bold))
                    .foregroundColor(.darkGrey)
                    .redacted(if: vm.username == nil)
            }
        }
    }
    
    private var CompleteProfile: some View {
        VStack(alignment: .leading) {
            Text("Profile.ProfileConfiguration")
                .font(.system(.title3, design: .rounded, weight: .bold))
                .foregroundColor(.darkGrey)

            NavigationLink {
                CompleteProfileView()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(height: 120)
                        .foregroundColor(Color.accentColor.opacity(0.10))

                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            Text("Profile.OneStepLeft")
                                .font(.system(.headline, design: .rounded))
                                .foregroundColor(.darkGrey)
                            
                            Spacer()
                            
                            Image(systemName: "arrow.right")
                                .foregroundColor(.darkGrey50)
                        }
                        .frame(width: 320)

                        ZStack(alignment: .leading) {
                            Capsule()
                                .frame(width: 320, height: 10)
                                .foregroundColor(Color.accentColor.opacity(0.15))
                            Capsule()
                                .frame(width: 160, height: 10)
                                .foregroundColor(.accentColor)
                        }
                        
                        Text("Profile.CompleteProfile")
                            .font(.system(.subheadline, design: .rounded))
                            .foregroundColor(.darkGrey)
                    }
                }
            }
        }
        .padding(.bottom)
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
