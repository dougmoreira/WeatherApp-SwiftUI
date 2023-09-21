//
//  ForecastInteractorTests.swift
//  WeatherAppTests
//
//  Created by Douglas Moreira on 19/09/23.
//

import XCTest
@testable import WeatherApp

final class ForecastInteractorTests: XCTestCase {
    private let presenterSpy = ForecastPresentationLogicSpy()
    private let getForecastUseCaseSpy = GetForecastUseCaseSpy()
    
    private lazy var sut = ForecastInteractor(
        presenter: presenterSpy,
        getForecast: getForecastUseCaseSpy
    )
    
    func test_getCurrentForecast_whenHasForecastToBeReturned_shouldCallPresenterWithCorrectParams() {
        let currentWeather = CurrentWeather(temperature: 0)
        
        getForecastUseCaseSpy.getForecastCompletionToBeReturned = .success(currentWeather)
        
        sut.getCurrentForecast()
        
        XCTAssertEqual(getForecastUseCaseSpy.getForecastCallCount, 1)
        XCTAssertEqual(presenterSpy.presentForecastCallCount, 1)
        XCTAssertEqual(presenterSpy.presentForecastTemperaturePassed, currentWeather.temperature)
        XCTAssertEqual(presenterSpy.presentLoadingCallCount, 1)
    }
    
    func test_getCurrentForecast_whenGotSomeError_shouldCallPresenterWithCorrectParams() {
        getForecastUseCaseSpy.getForecastCompletionToBeReturned = .failure(.error)
        
        sut.getCurrentForecast()
        
        XCTAssertEqual(getForecastUseCaseSpy.getForecastCallCount, 1)
        XCTAssertEqual(presenterSpy.presentForecastErrorCallCount, 1)
        XCTAssertEqual(presenterSpy.presentLoadingCallCount, 1)
    }

}
