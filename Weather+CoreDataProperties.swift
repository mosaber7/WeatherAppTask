//
//  Weather+CoreDataProperties.swift
//  
//
//  Created by Saber on 09/09/2021.
//
//

import Foundation
import CoreData


extension Weather {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Weather> {
        return NSFetchRequest<Weather>(entityName: "Weather")
    }

    @NSManaged public var weatherDescription: String?

}
