//
//  CreateListingView.swift
//  Loopable
//
//  Created by Mattia Cintura on 27/04/23.
//

import SwiftUI
import PhotosUI

struct CreateListingView: View {
    @StateObject private var vm = CreateListingViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    Group {
                        // Title
                        DefaultTextField("CreateListing.Title", systemName: "character.cursor.ibeam", value: $vm.title)
                        // Description
                        DefaultLargeTextField("CreateListing.Description", systemName: "text.justify.leading", limit: 6, value: $vm.description)
                        // Area of interest
                        VStack(alignment: .leading) {
                            HStack(spacing: 5) {
                                Image(systemName: "location.circle.fill")
                                Text("CreateListing.Location")
                            }
                            .font(.system(.headline, design: .rounded))
                            .foregroundColor(.darkGrey)
                            .padding(.leading)
                            
                            ZStack(alignment: .leading) {
                                ZStack(alignment: .trailing) {
                                    RoundedRectangle(cornerRadius: 15)
                                        .frame(height: 50)
                                        .foregroundColor(Color(UIColor.systemBackground))
                                        .shadow(color: .darkGrey.opacity(0.25), radius: 10)
                                    
                                    Picker(selection: $vm.areaOfInterest) {
                                        ForEach(ProvinceOfItaly.allCases, id: \.self) { province in
                                            Text(province.rawValue)
                                                .tag(province)
                                        }
                                    } label: {
                                        
                                    }
                                    .tint(.darkGrey)
                                }
                                Text("CreateListing.Location")
                                    .padding(.horizontal)
                                    .font(.system(.body, design: .rounded))
                                    .foregroundColor(.gray.opacity(0.5))
                            }
                            .padding(.horizontal)
                        }
                        // Price
                        VStack(alignment: .leading) {
                            HStack(spacing: 5) {
                                Image(systemName: "eurosign.circle.fill")
                                Text("CreateListing.Price")
                            }
                            .font(.system(.headline, design: .rounded))
                            .foregroundColor(.darkGrey)
                            .padding(.leading)
                            
                            ZStack(alignment: .leading) {
                                ZStack(alignment: .trailing) {
                                    RoundedRectangle(cornerRadius: 15)
                                        .frame(width: 210, height: 50)
                                        .foregroundColor(Color(UIColor.systemBackground))
                                        .shadow(color: .darkGrey.opacity(0.25), radius: 10)
                                    Image(systemName: "eurosign")
                                        .padding(.trailing)
                                        .foregroundColor(.darkGrey)
                                }
                                TextField("CreateListing.Price.Placeholder", text: $vm.dailyPrice)
                                    .keyboardType(.numberPad)
                                    .padding(.horizontal)
                                    .font(.system(.body, design: .rounded))
                            }
                            .padding(.horizontal)
                        }
                        // Photos
                        VStack(alignment: .leading) {
                            HStack(spacing: 5) {
                                Image(systemName: "photo.on.rectangle.angled")
                                Text("CreateListing.Photos")
                            }
                            .font(.system(.headline, design: .rounded))
                            .foregroundColor(.darkGrey)
                            .padding(.leading)
                            
                            ZStack(alignment: .top) {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(height: vm.images.isEmpty ? 50 : 135)
                                    .foregroundColor(Color(UIColor.systemBackground))
                                    .shadow(color: .darkGrey.opacity(0.25), radius: 10)
                                
                                VStack {
                                    HStack {
                                        Text("CreateListing.Photos.Placeholder")
                                            .padding(.horizontal)
                                            .font(.system(.body, design: .rounded))
                                            .foregroundColor(.gray.opacity(0.5))
                                        
                                        Spacer()
                                        
                                        PhotosPicker(
                                            selection: $vm.selectedImages,
                                            maxSelectionCount: 5,
                                            matching: .images,
                                            photoLibrary: .shared()
                                        ) {
                                            Image(systemName: "plus.circle.fill")
                                                .padding(.trailing)
                                                .foregroundColor(.darkGrey)
                                        }
                                    }
                                    .padding(.top, 15)
                                    
                                    if !vm.images.isEmpty {
                                        Divider()
                                            .padding(.horizontal)
                                        
                                        ScrollView(.horizontal, showsIndicators: false) {
                                            HStack {
                                                ForEach(vm.images, id: \.self) { image in
                                                    ZStack(alignment: .topTrailing) {
                                                        Image(uiImage: image)
                                                            .resizable()
                                                            .scaledToFill()
                                                            .frame(height: 70)
                                                            .cornerRadius(5)
                                                        
                                                        Button {
                                                            vm.removeImage(image: image)
                                                        } label: {
                                                            Image(systemName: "minus.circle.fill")
                                                                .renderingMode(.original)
                                                        }
                                                    }
                                                }
                                            }
                                            .padding(.horizontal)
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                        // Category
                        VStack(alignment: .leading) {
                            HStack(spacing: 5) {
                                Image(systemName: "tag")
                                Text("CreateListing.Category")
                            }
                            .font(.system(.headline, design: .rounded))
                            .foregroundColor(.darkGrey)
                            .padding(.leading)
                            
                            ZStack(alignment: .leading) {
                                ZStack(alignment: .trailing) {
                                    RoundedRectangle(cornerRadius: 15)
                                        .frame(height: 50)
                                        .foregroundColor(Color(UIColor.systemBackground))
                                        .shadow(color: .darkGrey.opacity(0.25), radius: 10)
                                    Image(systemName: "chevron.up.chevron.down")
                                        .padding(.trailing)
                                        .foregroundColor(.darkGrey)
                                }
                                Text("CreateListing.Category.Placeholder")
                                    .padding(.horizontal)
                                    .font(.system(.body, design: .rounded))
                                    .foregroundColor(.gray.opacity(0.5))
                            }
                            .padding(.horizontal)
                        }
                        // Purchase year
                        DefaultNumberField("CreateListing.PurchaseYear", systemName: "calendar", value: $vm.yearOfPurchase)
                        // Condition
                        VStack(alignment: .leading) {
                            HStack(spacing: 5) {
                                Image(systemName: "sparkles")
                                Text("CreateListing.Condition")
                            }
                            .font(.system(.headline, design: .rounded))
                            .foregroundColor(.darkGrey)
                            .padding(.leading)
                            
                            ZStack(alignment: .leading) {
                                ZStack(alignment: .trailing) {
                                    RoundedRectangle(cornerRadius: 15)
                                        .frame(height: 50)
                                        .foregroundColor(Color(UIColor.systemBackground))
                                        .shadow(color: .darkGrey.opacity(0.25), radius: 10)
                                    Image(systemName: "chevron.up.chevron.down")
                                        .padding(.trailing)
                                        .foregroundColor(.darkGrey)
                                }
                                Text("CreateListing.Condition.Placeholder")
                                    .padding(.horizontal)
                                    .font(.system(.body, design: .rounded))
                                    .foregroundColor(.gray.opacity(0.5))
                            }
                            .padding(.horizontal)
                        }
                        // Available from
                        DefaultDateField("CreateListing.Available", placeholder: "CreateListing.Available.Placeholder", systemImage: "calendar", value: $vm.availabilityFrom)
                        // Phone number
                        DefaultTextField("CreateListing.PhoneNumber", systemName: "phone", value: $vm.phoneNumber)
                    }
                    Button {
                        if vm.progress < 2 {
                            vm.progress += 1
                        }
                    } label: {
                        Text(vm.progress == 2 ? "CreateListing.Publish" : "Shared.Next")
                            .frame(width: UIScreen.main.bounds.width - 30, height: 55)
                            .font(.system(.headline, design: .rounded))
                            .foregroundColor(.white)
                            .background(Color.accentColor)
                            .cornerRadius(10)
                    }
                    .padding(.bottom)
                    .disabled(vm.disableButton())
                }
            }
            .navigationTitle("CreateListing.NavigationTitle")
            .navigationBarTitleDesign(.darkGrey, rounded: true)
            .onAppear {
                vm.photosPermission()
            }
        }
    }
}

struct CreateListingView_Previews: PreviewProvider {
    static var previews: some View {
        CreateListingView()
    }
}

extension CreateListingView {
}
