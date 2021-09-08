//
//  HomeInteractorTests.swift
//  WeatherTask_GizaSysTests
//
//  Created by Saber on 08/09/2021.
//

import XCTest
@testable import WeatherTask_GizaSys

class HomeInteractorTests: XCTestCase {
    
    var sut: HomeInteractor!
    var mockOutput: HomeInteractorOutputProtocol?
    
    override func setUp(){
       sut = HomeInteractor()
        mockOutput = MockHomeInteractorOutputProtocol()
        sut.presenter = mockOutput
    }

    override func tearDown() {
        self.sut = nil
        self.mockOutput = nil
        super.tearDown()
    }
    func getCurrentCityDayWeather_Test(){
        sut.getCurrentCityDayWeather(cityName: "Cairo")
        XCTAssert(mockOutput.)
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
