//
//  CityDayWeather+CoreDataProperties.swift
//  
//
//  Created by Saber on 09/09/2021.
//
//

import Foundation
import CoreData


extension CityDayWeather {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CityDayWeather> {
        return NSFetchRequest<CityDayWeather>(entityName: "CityDayWeather")
    }

    @NSManaged public var name: String?
    @NSManaged public var main: Main?
    @NSManaged public var weather: NSSet?
    @NSManaged public var wind: Wind?

}

// MARK: Generated accessors for weather
extension CityDayWeather {

    @objc(addWeatherObject:)
    @NSManaged public func addToWeather(_ value: Weather)

    @objc(removeWeatherObject:)
    @NSManaged public func removeFromWeather(_ value: Weather)

    @objc(addWeather:)
    @NSManaged public func addToWeather(_ values: NSSet)

    @objc(removeWeather:)
    @NSManaged public func removeFromWeather(_ values: NSSet)

}
