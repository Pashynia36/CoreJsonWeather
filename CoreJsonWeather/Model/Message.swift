//
//  Message.swift
//  CoreJsonWeather
//
//  Created by Pavlo Novak on 3/22/18.
//  Copyright © 2018 Pavlo Novak. All rights reserved.
//

import Foundation

struct MessageModel: Decodable {
    
    let cod: String
    let message: Double
    let cnt: Int
    let list: [ListModel]
    let city: CityModel
}

struct CityModel: Decodable {
    
    let id: Int
    let name: String
    let coord: CoordModel
    let country: String
}

struct ListModel: Decodable {
    
    let dt: Int64
    let main: MainModel
    let weather: [WeatherModel]
    let clouds: CloudsModel
    let wind: WindModel
    let rain: RainModel?
    let snow: SnowModel?
    let sys: SysModel
    let dtTxt: String
    
    enum CodingKeys: String, CodingKey {
        
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

struct MainModel: Decodable {
    
    let temp: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Double
    let seaLevel: Double
    let grndLevel: Double
    let humidity: Int
    let tempKf: Double
    
    enum CodingKeys: String, CodingKey {
        
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

struct WeatherModel: Decodable {
    
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct WindModel: Decodable {
    
    let speed: Double
    let degree: Double?
}

struct CoordModel: Decodable {
    
    let lat: Double
    let lon: Double
}

struct RainModel: Decodable {
    
    let threeH: Double?
    enum CodingKeys: String, CodingKey {
        case threeH = "3h"
    }
}

struct SnowModel: Decodable{
    
    let threeH: Double?
    enum CodingKeys: String, CodingKey {
        case threeH = "3h"
    }
}

struct SysModel: Decodable {
    
    let pod: String
}

struct CloudsModel: Decodable {
    
    let all: Int
}
