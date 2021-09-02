//
//  HomePresenter.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 02/09/2021.
//

import Foundation

class HomePresenter: HomePresenterProtocol, HomeInteractorOutputProtocol {
    
    var city: City?
    
    var numberOfRows: Int{
        return 5
    }
    
   
    weak var view: HomeViewProtocol?
    private let interactor : HomeInteractorInputProtocol
    private let router: HomeRouterProtocol
    init(view: HomeViewProtocol, interactor: HomeInteractorInputProtocol, router: HomeRouterProtocol){
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    func dataFetchedSuccessfully(city: City) {
        self.city = city
        view?.presentData()
    }
    
    func dateFetchingFailed(with error: Error) {
        print(error)
    }

}
