//
//  LocationManger.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 05/09/2021.
//

import Foundation
import CoreLocation

class LocationManager:NSObject, CLLocationManagerDelegate{
    // Singleton
    static let shared = LocationManager()
    
    let manager = CLLocationManager()
    
    var compeletion: ((CLLocation?)-> Void)?
    

    func getUserLocation(compeletion: @escaping ((CLLocation?)-> Void)){
        

        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.startUpdatingLocation()
       self.compeletion = compeletion

    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        
        compeletion?(location)
        manager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        compeletion?(nil)
    }
    
    func resolveLocationName(with location: CLLocation, compeletion: @escaping ((String?)-> Void)){
        
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(location, preferredLocale: .current) { placesMarks, error in
            guard let place = placesMarks?.first else{
                compeletion(nil)
                return
            }
            compeletion(place.locality)
            
        }
        
    }
    
    func getCityName(completion: @escaping ((String?)-> Void)){
        
        LocationManager.shared.getUserLocation { (location) in
            
            
            guard let location = location else{
                switch self.manager.authorizationStatus{
                
                case .notDetermined:
                    completion(nil)
                case .restricted:
                    completion(nil)
                case .denied:
                    completion(nil)
                case .authorizedAlways:
                    break
                case .authorizedWhenInUse:
                    break
                @unknown default:
                    break
                }
                return
            }
            self.helper(with: location) { (locationName) in
                completion(locationName!)

            }
            
        }
    }
    
    private func helper(with location: CLLocation, completion: @escaping ((String?)-> Void)){
        LocationManager.shared.resolveLocationName(with: location) { (LocationName) in
            completion(LocationName)
        }
       
    }
}
