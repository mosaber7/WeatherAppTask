//
//  coreDataManager.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 08/09/2021.
//

import Foundation
import CoreData


class CoreDataManager{
    
    static let shared = CoreDataManager()
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "WeatherTask_GizaSys")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    private func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {

                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    func save(_ jsonData: Data){
        let decoder = JSONDecoder()
        decoder.userInfo[CodingUserInfoKey.managedObjectContext] = persistentContainer.viewContext
        let _ = try? decoder.decode([CityDayWeather].self, from: jsonData)
        saveContext()
    }
    
    func fetch()-> [CityDayWeather]?{
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CityDayWeather")
        do {
            if let object = try persistentContainer.viewContext.fetch(fetchRequest) as? [CityDayWeather]{
            return object
            
        }
        
        } catch {
            let coreDataError = error as NSError
            fatalError("Unresolved error \(coreDataError), \(coreDataError.userInfo)")
            
        }
        return nil
    }
    
}