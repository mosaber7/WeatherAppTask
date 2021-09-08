//
//  HomePresenterTests.swift
//  WeatherTask_GizaSysTests
//
//  Created by Saber on 08/09/2021.
//

import XCTest
@testable import WeatherTask_GizaSys

class HomePresenterTests: XCTestCase {

    var sut: HomePresenter!
    var view: HomeViewProtocol!
    var interactor: HomeInteractorInputProtocol!
    var router: HomeRouterProtocol!
    
    override func setUp()  {
         super.setUp()
        view = HomeRouter.createHomeModule() as! HomeViewProtocol
        interactor = HomeInteractor()
        router = HomeRouter()
        sut = HomePresenter(view: view, interactor: interactor, router: router)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
