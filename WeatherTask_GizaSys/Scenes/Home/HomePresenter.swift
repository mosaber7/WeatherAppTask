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
    func ConfigureCell(cell: CityCellViewProtocol, at index: IndexPath)
    func selectCty(at index: IndexPath)
    var view: HomeViewProtocol?{get set}
    var numberOfRows: Int{ get}
    var cities: [City]{set get}
}
//MARK: - Interactor-Presenter Protocol
protocol HomeInteractorOutputProtocol: AnyObject {
    func dataFetchedSuccessfully(city: City)
    func dateFetchingFailed(with error: Error)
}

//MARK: - Home Presenter class
class HomePresenter: HomePresenterProtocol, HomeInteractorOutputProtocol {
    
    var numberOfRows: Int{
        return 5
    }
    
    var cities = [City]()
    weak var view: HomeViewProtocol?
    private let interactor : HomeInteractorInputProtocol
    private let router: HomeRouterProtocol
    
    init(view: HomeViewProtocol, interactor: HomeInteractorInputProtocol, router: HomeRouterProtocol){
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func presenterDidLoad() {
        interactor.getCity()
    }
    func dataFetchedSuccessfully(city: City) {
        for _ in 0..<5{
            self.cities.append(city)
            
        }
        view?.presentData()
    }
    
    func dateFetchingFailed(with error: Error) {
        print(error)
    }
    
    func selectCty(at index: IndexPath) {
        let selectedCity = cities[index.row]
        let cityDetailsRoute = HomeNavigationRoutes.Details(selectedCity)
        view?.navigate(to: cityDetailsRoute)
    }
    
    func ConfigureCell(cell: CityCellViewProtocol, at index: IndexPath) {
        let city = cities[index.row]
        let model = CityViewModel(city: city)
        cell.configure(cityViewModel: model)
    }
    
    
}
