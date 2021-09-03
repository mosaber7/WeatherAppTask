//
//  HomePresenter.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 02/09/2021.
//

import Foundation


//MARK: - Presenter Protocol
protocol  HomePresenterProtocol: AnyObject {
    
    func presenterDidLoad()
    func ConfigureCell(cell: CityCellViewProtocol)
    var view: HomeViewProtocol?{get set}
    var numberOfRows: Int{ get}
    var city: City?{set get}
}
//MARK: - Interactor-Presenter Protocol
protocol HomeInteractorOutputProtocol: AnyObject {
    func dataFetchedSuccessfully(city: City)
    func dateFetchingFailed(with error: Error)
}

//MARK: - Home Presenter class
class HomePresenter: HomePresenterProtocol, HomeInteractorOutputProtocol {
    func ConfigureCell(cell: CityCellViewProtocol) {
        guard let city = city else {
            return
        }
        let model = CityViewModel(city: city)
        cell.configure(cityViewModel: model)
    }
    
    func presenterDidLoad() {
        interactor.getCity()
    }
    var numberOfRows: Int{
        return 5
    }
    
    var city: City?
    
    
   
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
