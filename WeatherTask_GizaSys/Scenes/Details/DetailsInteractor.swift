//
//  DetailsInteractor.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 03/09/2021.
//

import Foundation



protocol DetailsInteractorProtocol {
    var presenter: DetailPresenterProtocol?{get set}
    
}

class DetailsInteractor: DetailsInteractorProtocol {
    var presenter: DetailPresenterProtocol?
    private let request = cityRequest()
    
    
    func getCityFullWeather(){
        
    }


}
