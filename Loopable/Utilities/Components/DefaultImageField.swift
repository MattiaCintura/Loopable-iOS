//
//  DefaultImageField.swift
//  Loopable
//
//  Created by Mattia Cintura on 03/06/23.
//

import SwiftUI
import PhotosUI

struct DefaultImageField: View {
    @Binding var selectedImage: [PhotosPickerItem]
    @Binding var images: [UIImage]
    var name: LocalizedStringKey
    var placeholder: LocalizedStringKey
    var systemName: String
    var handleImageChange: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 5) {
                Image(systemName: systemName)
                Text(name)
            }
            .font(.system(.headline, design: .rounded))
            .foregroundColor(.darkGrey)
            .padding(.leading)
            
            ZStack(alignment: .top) {
                RoundedRectangle(cornerRadius: 15)
                    .frame(height: images.isEmpty ? 50 : 200)
                    .foregroundColor(Color(UIColor.systemBackground))
                    .shadow(color: .darkGrey.opacity(0.25), radius: 10)

                VStack {
                    HStack {
                        Text(placeholder)
                            .padding(.horizontal)
                            .font(.system(.body, design: .rounded))
                            .foregroundColor(.gray.opacity(0.5))

                        Spacer()

                        PhotosPicker(
                            selection: $selectedImage,
                            maxSelectionCount: 6,
                            matching: .images
                        ) {
                            Image(systemName: "plus.circle.fill")
                                .padding(.trailing)
                                .foregroundColor(.darkGrey)
                        }
                        .onChange(of: selectedImage) { _ in
                            handleImageChange()
                        }
                    }
                        .padding(.top, 15)
                    
                    if !images.isEmpty {
                        Divider()
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(images, id: \.self) { image in
                                    Image(uiImage: image)
                                        
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct DefaultImageField_Previews: PreviewProvider {
    static var previews: some View {
        DefaultImageField(
            selectedImage: .constant([]),
            images: .constant([]),
            name: "CreateListing.Photos",
            placeholder: "CreateListing.Photos.Placeholder",
            systemName: "photo.on.rectangle.angled") {
                
            }
            .previewLayout(PreviewLayout.sizeThatFits)
    }
}
