//
//  Sneaker.swift
//  clean-shoes
//
//  Created by Dimitar Prisadnikov on 06/04/2022.
//

import Foundation
import SwiftUI
import CoreLocation

struct Sneaker: Hashable, Codable, Identifiable{
    var id: String
    
    var name: String
    var weatherTypes: [Category]
    
    enum Category: String, CaseIterable, Codable{
        case rain = "Rain"
        case sunny = "Sunny"
        case snow = "Snow"
    }
    
//    var imageName: String
//    var image: Image{
//        Image(imageName)
//    }
    
    var imageId: String
    
    
    init(name: String, weather:[Category], image: String) {
        self.id = UUID().uuidString
        self.name = name
        self.weatherTypes = []
        //self.imageName = "Attached image for \(name)"
        self.imageId = image
        weather.forEach { weather in
            weatherTypes.append(weather)
        }
    }
    
    func getImgae() -> UIImage?{
        if let imageData = UserDefaults.standard.object(forKey: imageId) as? Data,
            let image = UIImage(data: imageData) {
            return image
        }
        let def = UIImage(named: "general-sneakers")
        return def
    }
}
