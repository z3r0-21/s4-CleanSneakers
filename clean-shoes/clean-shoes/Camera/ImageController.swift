//
//  ImageController.swift
//  clean-shoes
//
//  Created by Dimitar Prisadnikov on 18/04/2022.
//
//

import UIKit
import Foundation

class ViewController {
    
    enum StorageType {
        case userDefaults
        case fileSystem
    }
    
    func store(image: UIImage,
                       forKey key: String,
                       withStorageType storageType: StorageType) {
        if let pngRepresentation = image.pngData() {
            switch storageType {
            case .userDefaults:
                UserDefaults.standard.set(pngRepresentation,forKey: key)
            case .fileSystem:
                print("")
            }
        }
    }
    
    func retrieveImage(forKey key: String,
                               inStorageType storageType: StorageType) -> UIImage? {
        switch storageType {
        case .fileSystem:
            print("")
        case .userDefaults:
            if let imageData = UserDefaults.standard.object(forKey: key) as? Data,
                let image = UIImage(data: imageData) {
                return image
            }
        }
        
        return nil
    }
    
}
