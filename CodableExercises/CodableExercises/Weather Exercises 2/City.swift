//
//  City.swift
//  CodableExercises
//
//  Created by C4Q on 11/16/17.
//  Copyright © 2017 Melissa He @ C4Q. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let list: [City]
}

struct City: Codable {
    let name: String
    let main: GeneralInfo
    let weather: [WeatherInfo]
    let wind: WindInfo
}

struct GeneralInfo: Codable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
    let humidity: Double
}

struct WeatherInfo: Codable {
    let main: String
    let description: String
}

struct WindInfo: Codable {
    let speed: Double
}
