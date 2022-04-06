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
