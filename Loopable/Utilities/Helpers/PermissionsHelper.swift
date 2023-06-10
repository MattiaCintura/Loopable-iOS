//{
//  PermissionsHelper.swift
//  Loopable
//
//  Created by Mattia Cintura on 10/06/23.
//

import Foundation
import Photos

final class PermissionsHelper {
    static func requestPhotoLibraryAccess() throws {
        let status = PHPhotoLibrary.authorizationStatus()
        
        switch status {
        case .authorized:
            break
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { status in
                if status == .denied {
                    
                }
            }
            break
        case .denied, .restricted:
            throw PermissionsError.photosPermissionDenied
        case .limited:
            break
        @unknown default:
            throw PermissionsError.unknownPermissionError
        }
    }
}
