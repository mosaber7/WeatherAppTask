//
//  Main+CoreDataProperties.swift
//  
//
//  Created by Saber on 09/09/2021.
//
//

import Foundation
import CoreData


extension Main {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Main> {
        return NSFetchRequest<Main>(entityName: "Main")
    }

    @NSManaged public var humidity: Int32
    @NSManaged public var pressure: Int32
    @NSManaged public var temp: Double

}
