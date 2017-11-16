//
//  Color.swift
//  CodableExercises
//
//  Created by C4Q on 11/16/17.
//  Copyright © 2017 Melissa He @ C4Q. All rights reserved.
//

import Foundation

struct ColorScheme: Codable {
    let colors: [Color]
}

struct Color: Codable {
    let hex: Hex
    let rgb: RGB
    let name: Name
}

struct Hex: Codable {
    let value: String
    let clean: String
}

struct RGB: Codable {
    let fraction: Fraction
    let r: Double
    let g: Double
    let b: Double
}

struct Fraction: Codable {
    let r: Double
    let g: Double
    let b: Double
}

struct Name: Codable {
    let value: String
}
