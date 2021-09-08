//
//  Stubs.swift
//  WeatherTask_GizaSysTests
//
//  Created by Saber on 08/09/2021.
//

import Foundation
@testable import WeatherTask_GizaSys



class MockSearchView: SearchViewProtocol{
    var searchPresenter: SearchPresenterProtocol?
    var reloadDataCalled = false
    var navigateCalled = false
    var tableViewIsHidden = true
    
    func showTablView() {
        tableViewIsHidden = false
    }
    
    func reloadData() {
        reloadDataCalled = true
    }
    
    func navigate(to route: Route) {
        navigateCalled = true
    }
    
    
}
class HomePresenterMock: HomeDetailsDelegate{
    func addToFavorite(city: CityDayWeather) {
        
    }
    
    func hasCityInMainActivty(city: CityDayWeather) -> Bool {
        return true
    }
    
    
}
