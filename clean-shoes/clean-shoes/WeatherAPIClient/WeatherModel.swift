//
//  Weather.swift
//  clean-shoes
//
//  Created by Dimitar Prisadnikov on 06/04/2022.
//

import Foundation

struct WeatherModel: Codable {
    let data: WeatherData
}

struct WeatherData: Codable {
    let timelines: [WeatherTimelines]
}

struct WeatherTimelines: Codable {
    let intervals: [WeatherIntervals]
}

struct WeatherIntervals: Codable {
    let startTime: String
    let values: WeatherValue
}

struct WeatherValue: Codable {
    var weatherCode: Int
}


enum WeatherCode: String, Codable {
    //Clear
    case clear = "1000"
    case mostlyClear = "1100"
    
    //Cloudy or/and fog
    case partlyCloudy = "1101"
    case mostlyCloudy = "1102"
    case cloudy = "1001"
    case fog = "2000"
    case lightFog = "2100"
    
    //Wind
    case lightWind = "3000"
    case wind = "3001"
    case strongWind = "3002"
    
    //Rain
    case drizzle = "4000"
    case rain = "4001"
    case lightRain = "4200"
    case heavyRain = "4201"
    case thunderstorm = "8000"
    
    //Snow or/and ice
    case snow = "5000"
    case flurries = "5001"
    case lightSnow = "5100"
    case heavySnow = "5101"
    case freezingDrizzle = "6000"
    case freezingRain = "6001"
    case lightFreezingRain = "6200"
    case heavyFreezingRain = "6201"
    case icePellets = "7000"
    case heavyIcePellets = "7101"
    case lightIcePellets = "7102"
    
    //todo: update with relevant messages
    var description: String {
        switch self {
        case .clear, .mostlyClear:
            return ""
        case .partlyCloudy, .mostlyCloudy, .cloudy, .fog, .lightFog:
            return ""
        case .lightWind, .wind, .strongWind:
            return ""
        case .drizzle, .rain, .lightRain, .heavyRain, .thunderstorm:
            return ""
        case .snow, .flurries, .lightSnow, .heavySnow, .freezingDrizzle, .freezingRain, .lightFreezingRain, .heavyFreezingRain, .icePellets, .heavyIcePellets, .lightIcePellets:
            return ""

        }
    }
}

//Updates the UI every time data changes
struct Weather: Identifiable {
    let id = UUID()
    
    let weatherCode: WeatherCode
}
