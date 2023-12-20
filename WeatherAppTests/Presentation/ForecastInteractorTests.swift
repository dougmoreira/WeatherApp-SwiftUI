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
    
    func test_getCurrentForecast_whenHasForecastToBeReturned_shouldCallPresenterWithCorrectParams() throws {
        let expectedCurrentWeather: WeatherDataResponse = .mock()
        
        getForecastUseCaseSpy.getForecastCompletionToBeReturned = .success(expectedCurrentWeather)
        
        sut.getCurrentForecast()
        
        let responsePassed: WeatherDataResponse = try XCTUnwrap(presenterSpy.presentForecastWeatherDataPassed)
        
        XCTAssertEqual(getForecastUseCaseSpy.getForecastCallCount, 1)
        XCTAssertEqual(presenterSpy.presentForecastCallCount, 1)
        XCTAssertEqual(presenterSpy.presentLoadingCallCount, 1)
        XCTAssertEqual(String(describing: responsePassed.daily), String(describing: expectedCurrentWeather.daily))
        XCTAssertEqual(String(describing: responsePassed.current), String(describing: expectedCurrentWeather.current))
    }
    
    func test_getCurrentForecast_whenGotSomeError_shouldCallPresenterWithCorrectParams() {
        getForecastUseCaseSpy.getForecastCompletionToBeReturned = .failure(.error)
        
        sut.getCurrentForecast()
        
        XCTAssertEqual(getForecastUseCaseSpy.getForecastCallCount, 1)
        XCTAssertEqual(presenterSpy.presentForecastErrorCallCount, 1)
        XCTAssertEqual(presenterSpy.presentLoadingCallCount, 1)
    }

}

extension WeatherDataResponse {
    static func mock() -> WeatherDataResponse {
        .init(
            current: .init(temperature: 30, isDay: 1, weatherCode: 0),
            daily: .init(time: ["2023-12-20"], weatherCode: [0], temperatureMax: [30], temperatureMin: [20])
        )
    }
}
