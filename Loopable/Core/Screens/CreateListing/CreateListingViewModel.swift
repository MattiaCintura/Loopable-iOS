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
    @Published var areaOfInterest: ProvinceOfItaly? = nil
    @Published var dailyPrice: String = ""
    @Published var images: [UIImage] = []
    @Published var category: ProductCategory? = nil
    @Published var yearOfPurchase: String = ""
    @Published var condition: ProductCondition? = nil
    @Published var availabilityFrom: Date = Date()
    @Published var phoneNumber: String = ""
    
    @Published var selectedImages: [PhotosPickerItem] = []
    
    @Published var hasError = false
    @Published var errorMessage: String = ""

    func handleImageChange() -> Void {
        guard let item = selectedImages.first else {
            return
        }
        item.loadTransferable(type: Data.self) { [weak self] result in
            switch result {
            case .success(let data):
                if let data {
                    DispatchQueue.main.async {
                        guard let uiImage = UIImage(data: data) else {
                            return
                        }
                        self?.images.append(uiImage)
                    }
                }
            case .failure(let failure):
                fatalError("\(failure)")
            }
        }
    }
    
    func photosPermission() -> Void {
        do {
            try PermissionsHelper.requestPhotoLibraryAccess()
        } catch is PermissionsError {
            
        } catch {
            
        }
    }
}
