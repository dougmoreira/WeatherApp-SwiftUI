//
//  ForecastPresenterTests.swift
//  WeatherAppTests
//
//  Created by Douglas Moreira on 19/09/23.
//

import XCTest
@testable import WeatherApp

final class ForecastPresenterTests: XCTestCase {
    private let viewControllerSpy = ForecastDisplayLogicSpy()
    private lazy var sut = ForecastPresenter()
    
    func test_presentForecast_shouldCallViewControllerWithCorrectParams() {
        let temperature: Double = 32
        
        sut.view = viewControllerSpy
        sut.presentForecast(with: temperature)
        
        switch viewControllerSpy.updateStatePassed {
        case .content(temperature: let temperaturePassed):
            XCTAssertEqual(temperaturePassed, temperature)
        case .error:
            XCTFail("Got error instead content")
        case .loading:
            XCTFail("Got loading instead content")
        case .none:
            XCTFail()
        }
        
        XCTAssertEqual(viewControllerSpy.updateCallCount, 1)
    }
    
    func test_presentForecastError_shouldCallViewControllerWithCorrectParams() {
        sut.view = viewControllerSpy
        sut.presentForecastError()
        
        XCTAssertEqual(viewControllerSpy.updateCallCount, 1)
    }
    
    func test_presentForecast_whenViewControllerIsNil_shouldReturn() {
        let temperature: Double = 0
        
        sut.presentForecast(with: temperature)
        
        XCTAssertEqual(viewControllerSpy.updateCallCount, 0)
    }
    
    func test_presentForecastError_whenViewControllerIsNil_shouldReturn() {
        sut.presentForecastError()
        
        XCTAssertEqual(viewControllerSpy.updateCallCount, 0)
    }
    
}
