//
//  Stubs.swift
//  WeatherTask_GizaSysTests
//
//  Created by Saber on 08/09/2021.
//

import Foundation
@testable import WeatherTask_GizaSys


class HomeInteractorMock: HomeInteractorInputProtocol{
    var presenter: HomeInteractorOutputProtocol?
    
    func getCitiesDayWeather() {
        self.presenter?.CityDayDataFetchedSuccessfully(cityDayWeather: MockData.cityDayWeather)
    }
    
    func getUserLocation(completion: @escaping ((String?) -> Void)) {
        completion(MockData.cityDayWeather.name)
    }
    
    func getCurrentCityDayWeather(cityName: String) {
        self.presenter?.currentCityLocationFetchedSuccessfuly(cityDayWeather: MockData.cityDayWeather)
    }
    
    
}

class HomeViewMock: HomeViewProtocol{
    var presenter: HomePresenterProtocol?
    var reloadDataCalled = false
    var navigateCalled = false
    
    func reloadData() {
        reloadDataCalled  = true
    }
    
    func navigate(to route: Route) {
        navigateCalled = true
        
    }
 
}

class MockHomeInteractorOutputProtocol: HomeInteractorOutputProtocol{
    var city: CityDayWeather?

    func CityDayDataFetchedSuccessfully(cityDayWeather: CityDayWeather) {
        city = cityDayWeather
    }
    
    func dataFetchingFailed(with error: Error) {
        city = nil
    }
    
    func currentCityLocationFetchedSuccessfuly(cityDayWeather: CityDayWeather) {
        city = cityDayWeather
    }
    
    func currentCityLocationFetchedWithError(error: Error) {
        city = nil
    }
    
    
}

class MockHomeRouter: HomeRouterProtocol{
    
}


enum MockData {
    static var cityDayWeather : CityDayWeather{
        return CityDayWeather(weather: [weather], main: main, wind: wind, name: "test")
    }
    
    static var cityWeekWeather: CityWeekWeather{
        return CityWeekWeather(weather: [weekWeather], wind: wind, date: "0", main: mainClass)
    }
    
    static var weather : Weather{
        return Weather(weatherDescription: "Cloudy")
    }
    static var weekWeather: WeekWeather{
        return WeekWeather(weatherDescription: .brokenClouds)
    }
    static var main: Main{
        return Main(temp: 0, pressure: 0, humidity: 0)
    }
    static var mainClass: MainClass{
        return MainClass(temp: 0)
    }
    static var wind: Wind{
        return Wind(speed: 0, deg: 0)
    }
    
    static var indexPath: IndexPath{
        return IndexPath(row: 0, section: 0)
    }
    
    
}
