//
//  SearchPresenter.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 04/09/2021.
//

import Foundation

protocol SearchPresenterProtocol {
    var searchView: SearchViewProtocol?{get set}
    var rowsCount: Int{get}
    func textDidChange(searchText: String)
    func configureCell(cell: SearchCellViewProtocol, indexPath: IndexPath)
    func selectCity(at index: IndexPath)
}



class SearchPresenter {
    
    
    var cities: [CityDayWeather]
    private (set) var filteredCities = [CityDayWeather]()
    weak var searchView: SearchViewProtocol?
    var homePresenter: HomeDetailsDelegate!
    
    var rowsCount: Int {
        return filteredCities.count
    }
    
    
    init(view: SearchViewProtocol, cities: [CityDayWeather], homePresenter: HomeDetailsDelegate) {
        self.searchView = view
        self.cities = cities
        self.homePresenter = homePresenter
        
    }
    
    
}

// MARK: - SearchPresenterProtocol
extension SearchPresenter: SearchPresenterProtocol{
    func textDidChange(searchText: String) {
        searchView?.showTablView()
        filteredCities = []
        if searchText == ""{
            filteredCities = cities
            
        }else{
            for city in cities{
                if city.name.lowercased().contains(searchText.lowercased()){
                    filteredCities.append(city)
                }
            }
            self.searchView?.reloadData()
        }
    }
    
    func configureCell(cell: SearchCellViewProtocol, indexPath: IndexPath) {
        cell.configureCell(cityName: filteredCities[indexPath.row].name)
    }
    func selectCity(at index: IndexPath) {
        let selectedCity = filteredCities[index.row]
        let detailsRoute = SearchNavigationRoutes.Details(selectedCity, homePresenter)
        searchView?.navigate(to: detailsRoute)
    }
    
}
