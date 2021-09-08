//
//  SearchPresenterTests.swift
//  WeatherTask_GizaSysTests
//
//  Created by Saber on 08/09/2021.
//

import XCTest
@testable import WeatherTask_GizaSys

class SearchPresenterTests: XCTestCase {

    var sut: SearchPresenter?
    var view = MockSearchView()
    var homePresenter = HomePresenter(view: HomeViewMock(), interactor: HomeInteractorMock(), router: MockHomeRouter())
    
    
    override func setUp(){
        super.setUp()
        sut = SearchPresenter(view: view, cities: [MockData.cityDayWeather], homePresenter: homePresenter)
    }

    override func tearDown(){
        sut = nil
        super.tearDown()
    }
    
    func test_textDidChange_filteredCitiesIncreased_AND_TableViewShown(){
        XCTAssertTrue(view.tableViewIsHidden)
        let countBeforeEditing = sut!.filteredCities.count
        XCTAssertTrue(sut!.filteredCities.isEmpty)
        sut?.textDidChange(searchText: "t")
        XCTAssert(sut!.filteredCities.count > countBeforeEditing)
        XCTAssert(sut!.filteredCities.contains(MockData.cityDayWeather))
        XCTAssertFalse(view.tableViewIsHidden)

        
    }
    func test_selectCity_didNavigateToDestination(){
        sut?.textDidChange(searchText: "t")
        sut?.selectCity(at: MockData.indexPath)
        XCTAssertTrue(view.navigateCalled)
    }
   

}
