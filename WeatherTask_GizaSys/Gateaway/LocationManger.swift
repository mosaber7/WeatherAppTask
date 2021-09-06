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
    
    var compeletion: ((CLLocation)-> Void)?
    var statue: CLAuthorizationStatus?
    
    func getUserLocation(compeletion: @escaping ((CLLocation)-> Void)){
        
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.startUpdatingLocation()
        statue = manager.authorizationStatus
        switch manager.authorizationStatus {
        case .notDetermined:
            self.compeletion = nil
        case .restricted:
            self.compeletion = nil
        case .denied:
            self.compeletion = nil
        case .authorizedAlways:
            self.compeletion = compeletion
        case .authorizedWhenInUse:
            self.compeletion = compeletion
        @unknown default:
            self.compeletion = nil
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        
        compeletion?(location)
        manager.stopUpdatingLocation()
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
            
            self.helper(with: location) { (locationName) in
                completion(locationName)

            }
            
        }
    }
    
    private func helper(with location: CLLocation, completion: @escaping ((String?)-> Void)){
        LocationManager.shared.resolveLocationName(with: location) { (LocationName) in
            completion(LocationName)
        }
       
    }
}
