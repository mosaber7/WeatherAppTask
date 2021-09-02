//
//  City.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 02/09/2021.
//

import Foundation
//{
//   "coord":{
//      "lon":31.2497,
//      "lat":30.0626
//   },
//   "weather":[
//      {
//         "id":802,
//         "main":"Clouds",
//         "description":"scattered clouds",
//         "icon":"03d"
//      }
//   ],
//   "base":"stations",
//   "main":{
//      "temp":303.57,
//      "feels_like":305.01,
//      "temp_min":303.57,
//      "temp_max":303.57,
//      "pressure":1010,
//      "humidity":51
//   },
//   "visibility":10000,
//   "wind":{
//      "speed":5.66,
//      "deg":360
//   },
//   "clouds":{
//      "all":40
//   },
//   "dt":1630572754,
//   "sys":{
//      "type":1,
//      "id":2514,
//      "country":"EG",
//      "sunrise":1630553559,
//      "sunset":1630599430
//   },
//   "timezone":7200,
//   "id":360630,
//   "name":"Cairo",
//   "cod":200
//}

struct City: Codable {
    let weather: [Weather]
    let main: Main
    let wind: Wind

}




// MARK: - Main
struct Main: Codable {
    let temp: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case pressure, humidity
    }
}


// MARK: - Weather
struct Weather: Codable {
    let weatherDescription: String

    enum CodingKeys: String, CodingKey {
        case weatherDescription = "description"
    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
}
