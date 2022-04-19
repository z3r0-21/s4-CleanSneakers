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
    
    init(id: Int, fName: String, lat: Double, long: Double) {
        self.id = id
        self.firstName = fName
        self.coordinates = Coordinates(latitude: lat, longitude: long)
    }
}
