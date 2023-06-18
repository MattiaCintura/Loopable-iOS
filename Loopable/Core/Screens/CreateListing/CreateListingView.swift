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
    @State private var progress: Int = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    FormStepper(progress: progress)
                    switch progress {
                    case 0:
                        FisrtStep
                    case 1:
                        SecondStep
                            .onAppear {
                                vm.photosPermission()
                            }
                    case 2:
                        ThridStep
                    default:
                        EmptyView()
                    }
                    Spacer()
                    ButtonsRow
                        .padding(.bottom)
                }
            }
            .navigationTitle("CreateListing.NavigationTitle")
            .navigationBarTitleDesign(.darkGrey, rounded: true)
        }
    }
}

struct CreateListingView_Previews: PreviewProvider {
    static var previews: some View {
        CreateListingView()
    }
}

extension CreateListingView {
    private var FisrtStep: some View {
        VStack(spacing: 20) {
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
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(height: 50)
                        .foregroundColor(Color(UIColor.systemBackground))
                        .shadow(color: .darkGrey.opacity(0.25), radius: 10)
                    TextField("CreateListing.Location", text: .constant(""))
                        .padding(.horizontal)
                        .font(.system(.body, design: .rounded))
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
                    TextField("CreateListing.Price.Placeholder", value: .constant(""), formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                        .padding(.horizontal)
                        .font(.system(.body, design: .rounded))
                }
                .padding(.horizontal)
            }
        }
    }

    private var SecondStep: some View {
        VStack(spacing: 20) {
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
                                maxSelectionCount: 1,
                                photoLibrary: .shared()
                            ) {
                                Image(systemName: "plus.circle.fill")
                                    .padding(.trailing)
                                    .foregroundColor(.darkGrey)
                            }
                            .onChange(of: vm.selectedImages) { _ in
                                vm.handleImageChange()
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
        }
    }
    
    private var ThridStep: some View {
        VStack(spacing: 20) {
            // Available from
            DefaultDateField("CreateListing.Available", placeholder: "CreateListing.Available.Placeholder", systemImage: "calendar", value: $vm.availabilityFrom)
            // Phone number
            DefaultTextField("CreateListing.PhoneNumber", systemName: "phone", value: $vm.phoneNumber)
        }
    }
    
    private var ButtonsRow: some View {
        VStack {
            if progress > 0 {
                Button {
                    progress -= 1
                } label: {
                    Text("Shared.GoBack")
                        .font(.system(.footnote, design: .rounded))
                        .underline()
                        .foregroundColor(.lightGrey)
                }
            }
            Button {
                if progress < 2 {
                    progress += 1
                }
            } label: {
                Text(progress == 2 ? "CreateListing.Publish" : "Shared.Next")
                    .frame(width: UIScreen.main.bounds.width - 30, height: 55)
                    .font(.system(.headline, design: .rounded))
                    .foregroundColor(.white)
                    .background(Color.accentColor)
                    .cornerRadius(10)
            }
        }
    }
}
