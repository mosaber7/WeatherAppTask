//
//  DetailsInteractor.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 03/09/2021.
//

import Foundation



protocol DetailsInteractorProtocol {
    var presenter: DetailsPresenterInteractorProtocol?{get set}
    func getCityWeekWeather(cityName: String)
    
}

class DetailsInteractor: DetailsInteractorProtocol {
    
    var presenter: DetailsPresenterInteractorProtocol?
    private let request = cityRequest()
    
    
    func getCityWeekWeather(cityName: String){
        request.retrieveCityWeekWeather(cityName: cityName) { [weak self] result in
            switch result{
            
            case .success(let cityWeekWeather):
                self?.presenter?.cityWeekDataFetchedSuccessfully(weekWeather: cityWeekWeather)
            case .failure(let error):
                self?.presenter?.dataFetchingFailed(with: error)
            }
        }
    }
}
