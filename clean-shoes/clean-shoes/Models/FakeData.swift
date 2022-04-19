//
//  FakeData.swift
//  clean-shoes
//
//  Created by Dimitar Prisadnikov on 11/04/2022.
//

import Foundation
import Combine
import SwiftUI

final class FakeData: ObservableObject{
//    @Published var sneakers = [
//        Sneaker(name: "Flip Flops", weather: [Sneaker.Category.sunny, Sneaker.Category.snow, Sneaker.Category.rain], image: "")
//    ]
   @Published var sneakers: [Sneaker] = []
    var weather: Sneaker.Category = Sneaker.Category.sunny
    
   
    
    func getSuitableSneakers(weatherCode: String) -> [Sneaker]{
            var weather: String = ""
            
            if(Int(weatherCode)! >= 1000 && Int(weatherCode)! <= 3002){
        
                    weather = "Sunny"
                }
            else if(Int(weatherCode)! >= 4000 && Int(weatherCode)! <= 4201){
        
                    weather = "Rain"
                }
            else if(Int(weatherCode)! >= 5000 && Int(weatherCode)! <= 8000){
        
                    weather = "Snow"
                }
            
            var suitableSneakers: [Sneaker] = []
            for sneaker in sneakers {
                for type in sneaker.weatherTypes{
                    if(type.rawValue == weather){
                        suitableSneakers.append(sneaker)

                    }
                }
                
            }
            return suitableSneakers
    }
    
    //@Published var user = User(id: 1, fName: "John Doe", lat: 111, long: 222)
}


