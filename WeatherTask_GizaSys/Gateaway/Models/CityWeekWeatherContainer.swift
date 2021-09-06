//
//  CityWeekWeather.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 06/09/2021.
//

import Foundation
struct CityWeekWeatherContainer: Codable {
    let cod: String
    let message, cnt: Int
    let CityWeekWeather: [CityWeekWeather]
    let city: City
    enum CodingKeys: String, CodingKey {
        case cod, message, cnt, city
        case CityWeekWeather = "list"
    }
    
}

// MARK: - City
struct City: Codable {
    let id: Int
    let name: String
    let country: String
    
}



// MARK: - List
struct CityWeekWeather: Codable {
    let weather: [WeekWeather]
    let wind: Wind
    let date: String
    let main: MainClass

    enum CodingKeys: String, CodingKey {
    case weather, wind, main
    case date = "dt_txt"
    }
}



// MARK: - Week Weather
struct WeekWeather: Codable {
    let weatherDescription: Description

    enum CodingKeys: String, CodingKey {
        case weatherDescription = "description"
    }
}

struct MainClass: Codable {
    let temp: Double
}




enum Description: String, Codable {
    case clearSky = "clear sky"
    case fewClouds = "few clouds"
    case scatteredClouds = "scattered clouds"
    case brokenClouds = "broken clouds"
        case lightRain = "light rain"
        case overcastClouds = "overcast clouds"
}


