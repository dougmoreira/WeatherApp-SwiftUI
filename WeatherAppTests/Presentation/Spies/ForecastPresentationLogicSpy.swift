//
//  ForecastPresentationLogicSpy.swift
//  WeatherAppTests
//
//  Created by Douglas Moreira on 19/09/23.
//

import WeatherApp

final class ForecastPresentationLogicSpy: ForecastPresentationLogic {
    public private(set) var presentForecastCallCount: Int = 0
    public private(set) var presentForecastWeatherDataPassed: WeatherDataResponse?

    func presentForecast(with weatherData: WeatherDataResponse) {
        presentForecastCallCount += 1
        presentForecastWeatherDataPassed = weatherData
    }
    
    public private(set) var presentForecastErrorCallCount: Int = 0
    
    func presentForecastError() {
        presentForecastErrorCallCount += 1
    }
    
    public private(set) var presentLoadingCallCount: Int = 0
    
    func presentLoading() {
        presentLoadingCallCount += 1
    }
    
    public init() {}
    
}
