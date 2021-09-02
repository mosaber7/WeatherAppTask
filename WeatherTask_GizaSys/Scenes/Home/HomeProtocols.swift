//
//  HomeProtocols.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 02/09/2021.
//

import Foundation

protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol?{get set}
    func presentData()
    
}
protocol  HomePresenterProtocol: AnyObject {
    
    func presenterDidLoad()
    var view: HomeViewProtocol?{get set}
    var numberOfRows: Int{get}
    var city: City?{set get}
}
protocol HomeInteractorInputProtocol {
    var presenter: HomeInteractorOutputProtocol?{get set}
    func getCity()
}
protocol HomeInteractorOutputProtocol: AnyObject {
    func dataFetchedSuccessfully(city: City)
    func dateFetchingFailed(with error: Error)
}
protocol HomeRouterProtocol {
    
}
