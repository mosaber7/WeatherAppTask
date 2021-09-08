//
//  HomePresenterTests.swift
//  WeatherTask_GizaSysTests
//
//  Created by Saber on 08/09/2021.
//

import XCTest
@testable import WeatherTask_GizaSys

class HomePresenterTests: XCTestCase {

    var sut: HomePresenter?
    let view = HomeViewMock()
    var interactor =  HomeInteractorMock()
    var router = HomeRouter()
    
    override func setUp()  {
         super.setUp()
        sut = HomePresenter(view: view, interactor: interactor, router: router)
        interactor.presenter = sut
    }

    override func tearDown(){
       sut = nil
        super.tearDown()
    }
    
    func test_reloadData_isCalled(){
        self.sut?.view?.reloadData()
        XCTAssertTrue(view.reloadDataCalled)
    }
    
    func test_navigate_isCalled() {
        
        self.sut?.view?.navigate(to: HomeNavigationRoutes.Details(MockData.cityDayWeather, sut! ))
        XCTAssertTrue(view.navigateCalled)
        
    }
    
    func test_presenterDidLoad_fetchedDataSuccessfuly(){
        sut?.presenterDidLoad()
        XCTAssert(sut!.cities.contains(MockData.cityDayWeather))
        XCTAssert(sut!.favoriteCities.contains(MockData.cityDayWeather))
    }
    
    func test_did_Navigate_WhenSelected_Row(){
        sut?.presenterDidLoad()
        sut?.selectedCity(at: MockData.indexPath)
        XCTAssertTrue(view.navigateCalled)
    }
    
    func test_did_Navigate_When_searchBar_clicked(){
        sut?.searchBarClicked()
XCTAssertTrue(view.navigateCalled)
    }

    func test_removeCity_didRemoveCityFromModelArrady(){
        let countBeforeRemoval = sut!.favoriteCities.count
        sut?.removeCity(at: MockData.indexPath)
        XCTAssertEqual(sut?.favoriteCities.count, countBeforeRemoval - 1)
        XCTAssert(!sut!.favoriteCities.contains(MockData.cityDayWeather))
    }
    func test_addToFavorite_favoriteCitiesDidIncreasedByOne(){
        let countBeforeAdd = sut!.favoriteCities.count
        sut?.addToFavorite(city: MockData.cityDayWeather)
        XCTAssertEqual(sut?.favoriteCities.count, countBeforeAdd + 1)
    }
    
    func test_hasCityInMainActivity_returnTrueAfterAddingMockModel(){
        sut?.addToFavorite(city: MockData.cityDayWeather)
        XCTAssertTrue(sut!.hasCityInMainActivty(city: MockData.cityDayWeather))
    }
    func test_hasCityInMainActivity_returnFalseBeforeAddingMockModel_returnTrueAfter(){
        XCTAssertFalse(sut!.hasCityInMainActivty(city: MockData.cityDayWeather))
        sut?.addToFavorite(city: MockData.cityDayWeather)
        XCTAssertTrue(sut!.hasCityInMainActivty(city: MockData.cityDayWeather))
    }
    
   
}



