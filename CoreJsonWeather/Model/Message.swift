//
//  Message.swift
//  CoreJsonWeather
//
//  Created by Pavlo Novak on 3/22/18.
//  Copyright © 2018 Pavlo Novak. All rights reserved.
//

import Foundation


struct Message: Decodable {
    
    let cod: String
    let message: Double
    let cnt: Int
    let list: [List]
    let city: City
}

struct City: Decodable {
    
    let id: Int
    let name: String
    let coord: Coord
    let country: String
}

struct List: Decodable {
    
    let dt: Int64
    let main: Main
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let rain: Rain?
    let snow: Snow?
    let sys: Sys
    let dtTxt: String
    
    enum CodingKeys: String, CodingKey {
        
        // без кейса всех переменных ошибка
        case dt
        case main
        case weather
        case clouds
        case wind
        case rain
        case snow
        case sys
        case dtTxt = "dt_txt"
    }
}

struct Main: Decodable {
    
    let temp: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Double
    let seaLevel: Double
    let grndLevel: Double
    let humidity: Int
    let tempKf: Double
    
    enum CodingKeys: String, CodingKey {
        
        // без кейса всех переменных ошибка
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case tempKf = "temp_kf"
        case pressure
        case humidity
    }
}

struct Weather: Decodable {
    
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Wind: Decodable {
    
    let speed: Double
    let degree: Double?
}

struct Coord: Decodable {
    
    let lat: Double
    let lon: Double
}

struct Rain: Decodable {
    
    let threeH: Double?
    enum CodingKeys: String, CodingKey {
        case threeH = "3h"
    }
}

struct Snow: Decodable{
    
    let threeH: Double?
    enum CodingKeys: String, CodingKey {
        case threeH = "3h"
    }
}

struct Sys: Decodable {
    
    let pod: String
}

struct Clouds: Decodable {
    
    let all: Int
}
