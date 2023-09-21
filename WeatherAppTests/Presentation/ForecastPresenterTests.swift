//
//  ForecastPresenterTests.swift
//  WeatherAppTests
//
//  Created by Douglas Moreira on 19/09/23.
//

import XCTest
@testable import WeatherApp

final class ForecastPresenterTests: XCTestCase {
    private let viewSpy = ForecastDisplayLogicSpy()
    private lazy var sut = ForecastPresenter()
    
    func test_presentForecast_shouldCallViewControllerWithCorrectParams() {
        let temperature: Double = 32
        
        sut.view = viewSpy
        sut.presentForecast(with: temperature)
        
        switch viewSpy.updateStatePassed {
        case .content(temperature: let temperaturePassed):
            XCTAssertEqual(temperaturePassed, temperature)
        case .error:
            XCTFail("Got error instead content")
        case .loading:
            XCTFail("Got loading instead content")
        case .none:
            XCTFail()
        }
        
        XCTAssertEqual(viewSpy.updateCallCount, 1)
    }
    
    func test_presentForecastError_shouldCallViewControllerWithCorrectParams() throws {
        sut.view = viewSpy
        sut.presentForecastError()
        
        let statePassed = try XCTUnwrap(viewSpy.updateStatePassed)
        
        switch statePassed {
        case .content:
            XCTFail("Got a content instead expected error")
        case .loading:
            XCTFail("Got loading instead expected error")
        case .error:
            XCTAssertNotNil(statePassed)
        }
        
        XCTAssertEqual(viewSpy.updateCallCount, 1)
    }
    
    func test_presentForecast_whenViewIsNil_shouldReturn() {
        let temperature: Double = 0
        
        sut.presentForecast(with: temperature)
        
        XCTAssertNil(sut.view)
        XCTAssertNil(viewSpy.updateStatePassed)
        XCTAssertEqual(viewSpy.updateCallCount, 0)
    }
    
    func test_presentForecastError_whenViewIsNil_shouldReturn() {
        sut.presentForecastError()
        
        XCTAssertNil(sut.view)
        XCTAssertNil(viewSpy.updateStatePassed)
        XCTAssertEqual(viewSpy.updateCallCount, 0)
    }
    
}
