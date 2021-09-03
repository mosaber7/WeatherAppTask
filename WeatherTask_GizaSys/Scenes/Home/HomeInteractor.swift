//
//  HomeInteractor.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 02/09/2021.
//

import Foundation

//MARK: - HomeInteractorProtocol
protocol HomeInteractorInputProtocol {
    var presenter: HomeInteractorOutputProtocol?{get set}
    func getCity()
}

//MARK: - Interactor

class HomeInteractor: HomeInteractorInputProtocol{
   weak var presenter: HomeInteractorOutputProtocol?
    private let request = cityRequest()
    
    func getCity(){
    request.retrieveCityWeather(city: "Cairo") { [weak self] (result) in
        switch result{
        
        case .success(let city):
            self?.presenter?.dataFetchedSuccessfully(city: city)
        case .failure(let error):
            self?.presenter?.dateFetchingFailed(with: error)
        }
        
    }
    
    }
    
}
 
