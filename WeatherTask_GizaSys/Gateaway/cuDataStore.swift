//
//  cuDataStore.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 06/09/2021.
//

import Foundation
import UIKit

class DataStore{
    var allCities: [CityDayWeather] = []
        let itemArchiveURL: URL = {
            let documentsDirectories =
                FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            let documentDirectory = documentsDirectories.first!
            return documentDirectory.appendingPathComponent("items.plist")
        }()
    func removeCity(_ city: CityDayWeather){
        if let index = allCities.firstIndex(of: city){
            allCities.remove(at: index)
            
        }
    }
        @objc func saveChanges()->Bool{
            do {
                print("saving data to \(itemArchiveURL)")
                let encoder = PropertyListEncoder()
                let data = try encoder.encode(allCities)
                try data.write(to: itemArchiveURL, options: [.atomic])
                return true
            } catch  let encodingError{
                print("erroer encoding some data \(encodingError)")
                return false
            }
        }
    
        init() {
            do {
                    let data = try Data(contentsOf: itemArchiveURL)
                    let unarchiver = PropertyListDecoder()
                    let items = try unarchiver.decode([CityDayWeather].self, from: data)
                    allCities = items
            } catch{
                print("Error reading in saved items \(error)")
            }
    
            let notifactionCenter = NotificationCenter.default
            notifactionCenter.addObserver(self, selector: #selector(saveChanges), name: UIScene.didEnterBackgroundNotification, object: nil)
    
        }
    
}
