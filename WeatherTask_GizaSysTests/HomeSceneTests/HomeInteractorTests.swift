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
    var mockOutput = MockHomeInteractorOutputProtocol()
    
    override func setUp(){
       sut = HomeInteractor()
        sut.presenter = mockOutput
    }

    override func tearDown() {
        self.sut = nil
        super.tearDown()
    }
    
  

}

