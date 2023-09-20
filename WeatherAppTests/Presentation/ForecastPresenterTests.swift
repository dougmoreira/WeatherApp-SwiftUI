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
        let temperature: Double = 0
        
        sut.viewController = viewControllerSpy
        sut.presentForecast(with: temperature)
        
        XCTAssertEqual(viewControllerSpy.displayForecastTemperaturePassed, temperature)
        XCTAssertEqual(viewControllerSpy.displayForecastCallCount, 1)
    }
    
    func test_presentForecastError_shouldCallViewControllerWithCorrectParams() {
        sut.viewController = viewControllerSpy
        sut.presentForecastError()
        
        XCTAssertEqual(viewControllerSpy.displayForecastErrorCallCount, 1)
    }
    
    func test_presentForecast_whenViewControllerIsNil_shouldReturn() {
        let temperature: Double = 0
        
        sut.presentForecast(with: temperature)
        
        XCTAssertEqual(viewControllerSpy.displayForecastCallCount, 0)
    }
    
    func test_presentForecastError_whenViewControllerIsNil_shouldReturn() {
        sut.presentForecastError()
        
        XCTAssertEqual(viewControllerSpy.displayForecastErrorCallCount, 0)
    }
    
}
