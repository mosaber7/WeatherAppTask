//
//  DetailsPresenterTests.swift
//  WeatherTask_GizaSysTests
//
//  Created by Saber on 08/09/2021.
//

import XCTest
@testable import WeatherTask_GizaSys

class DetailsPresenterTests: XCTestCase {
    
    var sut: DetailsPresenter?
    var view = MockDetailsView()
    var homePresenter = HomePresenter(view: HomeViewMock(), interactor: HomeInteractorMock(), router: MockHomeRouter())
    
    override func setUp(){
        super.setUp()
        sut = DetailsPresenter(view: view, city: MockData.cityDayWeather , homePresenter: homePresenter, interactor: MockDetailsInteractor())
        
    }

    override func tearDown(){
        sut = nil
        super.tearDown()
    }
    
    func test_vieewDidLoad_reloadedData (){
        sut?.viewDidLoad()
        XCTAssertTrue(self.view.reloadDataIsCalled)
    }
//    func test_vieewDidLoad_CityWeekWeatherData_successfullyFetched(){
//        let countBeforeFetching = sut!.cityWeekWeather.count
//        sut?.viewDidLoad()
//        XCTAssert(sut!.cityWeekWeather.count > countBeforeFetching)
//
//    }
    func test_addToFavorite_addedSuccessfully(){
        let countBeforeAdding = homePresenter.favoriteCities.count
        sut?.addToFavorite()
        XCTAssert(homePresenter.favoriteCities.count > countBeforeAdding)
    }
    
}

class MockDetailsView: DetailsViewProtocol{
    var presenter: DetailPresenterProtocol?
    var addButtonIsHidden = false
    var reloadDataIsCalled = false
    
    func hideAddButton() {
        addButtonIsHidden = true
    }
    
    func reloadData() {
        reloadDataIsCalled = true
    }
    
    
}

class MockDetailsInteractor: DetailsInteractorProtocol{
    var presenter: DetailsPresenterInteractorProtocol?
    
    func getCityWeekWeather(cityName: String) {
        self.presenter?.cityWeekDataFetchedSuccessfully(weekWeather:[ MockData.cityWeekWeather, MockData.cityWeekWeather])
        
    }
    
    
}
