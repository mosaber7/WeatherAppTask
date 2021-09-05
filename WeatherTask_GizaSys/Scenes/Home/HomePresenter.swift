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
    func searchBarClicked()
    func removeCity(at index: IndexPath)
    var view: HomeViewProtocol?{get set}
    var numberOfRows: Int{ get}
    var cities: [City]{set get}
    var favoriteCities: [City]{set get}
}
//MARK: - Interactor-Presenter Protocol
protocol HomeInteractorOutputProtocol: AnyObject {
    func dataFetchedSuccessfully(city: City)
    func dateFetchingFailed(with error: Error)
}

protocol HomeDetailsDelegate: AnyObject{
    func addToFavorite(city: City)
}

//MARK: - Home Presenter class
class HomePresenter: HomePresenterProtocol, HomeInteractorOutputProtocol {
    
    var numberOfRows: Int{
        return favoriteCities.count
    }
    
    var cities = [City]()
    var favoriteCities =  [City]()
    weak var view: HomeViewProtocol?
    private let interactor : HomeInteractorInputProtocol
    private let router: HomeRouterProtocol
    
    init(view: HomeViewProtocol, interactor: HomeInteractorInputProtocol, router: HomeRouterProtocol){
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func presenterDidLoad() {
        OperationQueue.main.addOperation {
            self.interactor.getCity()
        }
        
    }
    func dataFetchedSuccessfully(city: City) {
        for _ in 0..<5{
            self.cities.append(city)
        }
        view?.presentData()
        print("Data fetiched successfully")
    }
    
    func dateFetchingFailed(with error: Error) {
        fatalError("Failed to fetch Data")
    }
    
    func selectCty(at index: IndexPath) {
        guard cities.count > 0 else{return}
        let selectedCity = cities[index.row]
        let cityDetailsRoute = HomeNavigationRoutes.Details(selectedCity, self)
        view?.navigate(to: cityDetailsRoute)
    }
    
    func ConfigureCell(cell: CityCellViewProtocol, at index: IndexPath) {
        guard cities.count > 0 else {
            return
        }
        let city = cities[index.row]
        let model = CityViewModel(city: city)
        cell.configure(cityViewModel: model)
    }
    func searchBarClicked() {
        let searchVCRoute = HomeNavigationRoutes.Search
        view?.navigate(to: searchVCRoute(cities, self))
    }
    func removeCity(at index: IndexPath) {
        guard index.row < favoriteCities.count else{
            return
        }
        self.favoriteCities.remove(at: index.row)
    }
    
    
}
//MARK: - confirming to the Details screen delegate
extension HomePresenter: HomeDetailsDelegate{
    func addToFavorite(city: City) {
        if let _ = favoriteCities.firstIndex(of: city){
            return
        }
        if favoriteCities.count == 5 {
            self.favoriteCities[1] = city
        }
        self.favoriteCities.append(city)
        view?.presentData()
    }
    
}
