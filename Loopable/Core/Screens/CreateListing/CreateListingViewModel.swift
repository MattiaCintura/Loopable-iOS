//
//  CreateListingViewModel.swift
//  Loopable
//
//  Created by Mattia Cintura on 22/05/23.
//

import Foundation
import SwiftUI
import PhotosUI
import UIKit
import Photos

@MainActor
final class CreateListingViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var areaOfInterest: ProvinceOfItaly = .agrigento
    @Published var dailyPrice: String = ""
    @Published var images: [UIImage] = []
    @Published var category: ProductCategory? = nil
    @Published var yearOfPurchase: String = ""
    @Published var condition: ProductCondition? = nil
    @Published var availabilityFrom: Date = .now
    @Published var phoneNumber: String = ""
    
    @Published var selectedImages: [PhotosPickerItem] = [] {
        didSet {
            handleImagesChange(from: selectedImages)
        }
    }
    
    @Published var hasError = false
    @Published var errorMessage: String = ""

    func handleImagesChange(from selections: [PhotosPickerItem]) -> Void {
        Task {
            var uiImages: [UIImage] = []
            for selection in selections {
                if let data = try? await selection.loadTransferable(type: Data.self) {
                    if let uiImage = UIImage(data: data) {
                        uiImages.append(uiImage)
                    }
                }
            }
            images = uiImages
        }
    }
    
    func disableButton() -> Bool {
        #if targetEnvironment(simulator)
        return false
        #else
        return title.isEmpty || description.isEmpty || dailyPrice.isEmpty || images.count >= 2 || yearOfPurchase.isEmpty || phoneNumber.isEmpty
        #endif
    }
    
    func removeImage(image: UIImage) -> Void {
        guard let index = images.firstIndex(of: image) else {
            return
        }
        
        images.remove(at: index)
    }
    
    func photosPermission() -> Void {
        do {
            try PermissionsHelper.requestPhotoLibraryAccess()
        } catch is PermissionsError {
            
        } catch {
            
        }
    }
}
