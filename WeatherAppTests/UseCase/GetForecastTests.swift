//
//  GetForecastTests.swift
//  WeatherAppTests
//
//  Created by Douglas Moreira on 19/09/23.
//

import XCTest
@testable import WeatherApp

final class GetForecastTests: XCTestCase {
    private let forecastRepositorySpy = ForecastRepositoryProtocolSpy()
    
    private lazy var sut = GetForecast(repository: forecastRepositorySpy)
    
    func test_getForecast_whenRequestFailure_shouldCompletionWithCorrectErrorType() {
        let expectedError: ForecastError = .error
        
        forecastRepositorySpy.getForecastCompletionToBeReturned = .failure(expectedError)
        
        sut.getForecast { result in
            switch result {
            case .success:
                XCTFail("Got success instead failure")
            case .failure(let failure):
                XCTAssertEqual(failure, expectedError)
            }
        }
        
        XCTAssertEqual(forecastRepositorySpy.getForecastCallCount, 1)
    }
    
    func test_getForecast_whenRequestSucced_shouldCompletionWithCorrectValue() {
        let expectedCurrentWeather: WeatherDataResponse = .mock()
        
        forecastRepositorySpy.getForecastCompletionToBeReturned = .success(expectedCurrentWeather)
        
        sut.getForecast { result in
            switch result {
            case .success(let success):
                XCTAssertEqual(String(describing: success?.daily.temperatureMax), String(describing: expectedCurrentWeather.daily.temperatureMax))
                XCTAssertEqual(String(describing: success?.daily.temperatureMin), String(describing: expectedCurrentWeather.daily.temperatureMin))
                XCTAssertEqual(String(describing: success?.daily.time), String(describing: expectedCurrentWeather.daily.time))
                XCTAssertEqual(String(describing: success?.daily.weatherCode), String(describing: expectedCurrentWeather.daily.weatherCode))
                XCTAssertEqual(String(describing: success?.current.isDay), String(describing: expectedCurrentWeather.current.isDay))
                XCTAssertEqual(String(describing: success?.current.weatherCode), String(describing: expectedCurrentWeather.current.weatherCode))
            case .failure(let failure):
                XCTAssertNil(failure)
            }
        }
        
        XCTAssertEqual(forecastRepositorySpy.getForecastCallCount, 1)
    }
}
