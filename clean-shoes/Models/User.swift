//
//  User.swift
//  clean-shoes
//
//  Created by Dimitar Prisadnikov on 06/04/2022.
//

import Foundation
import SwiftUI
import CoreLocation

struct User: Hashable, Codable, Identifiable{
    var id: Int
    var firstName: String
    var manualLocation: Bool = false
    var sneakers = [Sneaker]()
    
    private var imageName: String
    var image: Image{
        Image("User with ID: \(self.id)")
    }
    
    private var coordinates: Coordinates
    var selectedLocationCoordinates: CLLocationCoordinate2D{
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable{
        var latitude: Double
        var longitude: Double
    }
    
    
}
