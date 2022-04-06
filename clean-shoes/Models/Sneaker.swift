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
    var id: Int
    var name: String
    
    enum Category: String, CaseIterable, Codable{
        case rain = "Rain"
        case sunny = "Sunny"
        case snow = "Snow"
    }
    
    private var imageName: String
    var image: Image{
        Image("\(self.name) (ID: \(self.id))")
    }
}
