//
//  Wind+CoreDataProperties.swift
//  
//
//  Created by Saber on 09/09/2021.
//
//

import Foundation
import CoreData


extension Wind {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Wind> {
        return NSFetchRequest<Wind>(entityName: "Wind")
    }

    @NSManaged public var deg: Double
    @NSManaged public var speed: Double

}
