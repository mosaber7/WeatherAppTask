//
//  City.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 02/09/2021.
//

import Foundation
import CoreData
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
//


import Foundation
import CoreData

enum DecoderConfigurationError: Error {
    case missingManagedObjectContext
}

class CityDayWeather: NSManagedObject, Codable {
    @NSManaged var weather: Set<Weather>
    @NSManaged var main: Main
    @NSManaged var wind: Wind
    @NSManaged var name: String

    enum CodingKeys: String, CodingKey{
        case weather, main, wind, name
    }
    
    required convenience init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
            throw DecoderConfigurationError.missingManagedObjectContext
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.weather = try container.decode(Set<Weather>.self, forKey: .weather)
        self.main = try container.decode(Main.self, forKey: .main)
        self.wind = try container.decode(Wind.self, forKey: .wind)
        self.name = try container.decode(String.self, forKey: .name)
        
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(weather, forKey: .weather)
        try container.encode(wind, forKey: .wind)
        try container.encode(main, forKey: .main)
        try container.encode(name, forKey: .name)
    }
    
}

class Main:NSManagedObject, Codable {
    @NSManaged var temp: Double
    @NSManaged var pressure: Int
    @NSManaged var humidity: Int

    enum CodingKeys: String, CodingKey{
        case temp, pressure, humidity
    }
    
    required convenience init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
            throw DecoderConfigurationError.missingManagedObjectContext
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.temp = try container.decode(Double.self, forKey: .temp)
        self.pressure = try container.decode(Int.self, forKey: .pressure)
        self.humidity = try container.decode(Int.self, forKey: .humidity)
        
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(temp, forKey: .temp)
        try container.encode(pressure, forKey: .pressure)
        try container.encode(humidity, forKey: .humidity)
    }
}

class Weather:NSManagedObject, Codable {
    @NSManaged var weatherDescription: String
    
    enum CodingKeys: String, CodingKey{
        case weatherDescription = "description"
    }
    
    required convenience init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
            throw DecoderConfigurationError.missingManagedObjectContext
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.weatherDescription = try container.decode(String.self, forKey: .weatherDescription)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(weatherDescription, forKey: .weatherDescription)
    }
}

class Wind:NSManagedObject, Codable {
    @NSManaged var speed: Double
    @NSManaged var deg: Int

    enum CodingKeys: String, CodingKey{
        case speed, deg
    }
    
    required convenience init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
            throw DecoderConfigurationError.missingManagedObjectContext
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.speed = try container.decode(Double.self, forKey: .speed)
        self.deg = try container.decode(Int.self, forKey: .deg)

    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(speed, forKey: .speed)
        try container.encode(deg, forKey: .deg)
    }
}

