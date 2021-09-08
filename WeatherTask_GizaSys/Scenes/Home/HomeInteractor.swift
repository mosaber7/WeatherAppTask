//
//  HomeInteractor.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 02/09/2021.
//

import Foundation
import CoreLocation

//MARK: - HomeInteractorProtocol
protocol HomeInteractorInputProtocol {
    var presenter: HomeInteractorOutputProtocol?{get set}
    func getCitiesDayWeather()
    func getUserLocation(completion: @escaping ((String?)-> Void))
    func getCurrentCityDayWeather(cityName: String)
}

//MARK: - Interactor

class HomeInteractor: HomeInteractorInputProtocol{
    weak var presenter: HomeInteractorOutputProtocol?
    private let request = cityRequest()
    
    func getCitiesDayWeather(){
        let randomCitiies = ["Cairo", "Tokyo", "Kansas", "Luxor", "Giza"]
        for city in randomCitiies{
        request.retrieveCityDayWeather(cityName: city) { [weak self] (result) in
            switch result{
            
            case .success(let city):
                self?.presenter?.CityDayDataFetchedSuccessfully(cityDayWeather: city)
            case .failure(let error):
                self?.presenter?.dataFetchingFailed(with: error)
            }
            
        }
        }
        
    }
    func getCurrentCityDayWeather(cityName: String){
        
        request.retrieveCityDayWeather(cityName: cityName) { [weak self] result in
            switch result{
            
            case .success(let cityDayWeather):
                self?.presenter?.currentCityLocationFetchedSuccessfuly(cityDayWeather: cityDayWeather)
            case .failure(let error):
  
                self?.presenter?.currentCityLocationFetchedWithError(error: error)
            }
        }
    }
    func getUserLocation(completion: @escaping((String?)-> Void)){
        LocationManager.shared.getCityName { (cityName) in
            completion(cityName)
        }
    }
    
    
    
}


