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
    func selectedCity(at index: IndexPath)
    func searchBarClicked()
    func removeCity(at index: IndexPath)
    var view: HomeViewProtocol?{get set}
    var numberOfRows: Int{ get}
    var cities: [CityDayWeather]{set get}
    var favoriteCities: [CityDayWeather]{set get}
}
//MARK: - Interactor-Presenter Protocol
protocol HomeInteractorOutputProtocol: AnyObject {
    func CityDayDataFetchedSuccessfully(cityDayWeather: CityDayWeather)
    func dataFetchingFailed(with error: Error)
    func currentCityLocationFetchedSuccessfuly(cityDayWeather: CityDayWeather)
    func currentCityLocationFetchedWithError(error: Error)
}

protocol HomeDetailsDelegate: AnyObject{
    func addToFavorite(city: CityDayWeather)
    func hasCityInMainActivty(city: CityDayWeather) -> Bool
}

//MARK: - Home Presenter class
class HomePresenter {
    
    var numberOfRows: Int{
        return favoriteCities.count
    }
    
    private let numberOfMainCities = 5
    var cities = [CityDayWeather]()
    var favoriteCities =  [CityDayWeather]()
    weak var view: HomeViewProtocol?
    private let interactor : HomeInteractorInputProtocol
    private let router: HomeRouterProtocol
    
    init(view: HomeViewProtocol, interactor: HomeInteractorInputProtocol, router: HomeRouterProtocol){
        self.view = view
        self.interactor = interactor
        self.router = router
    }

}

//MARK: - Home presenter
extension HomePresenter: HomePresenterProtocol{
    func presenterDidLoad() {
        self.interactor.getCitiesDayWeather()
        self.interactor.getUserLocation { (cityName) in
            guard let cityName = cityName else{
                self.interactor.getCurrentCityDayWeather(cityName: "London")
                self.view?.reloadData()
                return
            }
            self.interactor.getCurrentCityDayWeather(cityName: cityName)
            self.view?.reloadData()
        }
    }
    
    
    func selectedCity(at index: IndexPath) {
        guard favoriteCities.count > 0 else{return}
        let selectedCity = favoriteCities[index.row]
        let cityDetailsRoute = HomeNavigationRoutes.Details(selectedCity, self)
        view?.navigate(to: cityDetailsRoute)
    }
    
    func ConfigureCell(cell: CityCellViewProtocol, at index: IndexPath) {
        guard favoriteCities.count > 0 else {
            return
        }
        let city = favoriteCities[index.row]
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
    
    
    func addToFavorite(city: CityDayWeather) {
        
        if favoriteCities.count == self.numberOfMainCities {
            self.favoriteCities[1] = city
        }
        self.favoriteCities.append(city)
        view?.reloadData()
    }
    func hasCityInMainActivty(city: CityDayWeather) -> Bool{
        if let _ = favoriteCities.firstIndex(of: city){
            return true
        }
        return false
    }
    
}
// MARK: - Home Interactor Output Protocol

extension HomePresenter: HomeInteractorOutputProtocol{
    
    func CityDayDataFetchedSuccessfully(cityDayWeather: CityDayWeather) {

            self.cities.append(cityDayWeather)
        print("Data fetiched successfully")
    }
    
    func dataFetchingFailed(with error: Error) {
        fatalError("Failed to fetch Data")
    }
    
    func currentCityLocationFetchedSuccessfuly(cityDayWeather: CityDayWeather){
        guard !favoriteCities.isEmpty else {
            self.favoriteCities.append(cityDayWeather)
            self.view?.reloadData()
            return
        }
        self.favoriteCities[0] = cityDayWeather
        if !cities.contains(cityDayWeather){
            self.cities.append(cityDayWeather)
        }
        self.view?.reloadData()
    }
    
    func currentCityLocationFetchedWithError(error: Error){
        // defult current city set as Lodon
        print("error")
    }
}
