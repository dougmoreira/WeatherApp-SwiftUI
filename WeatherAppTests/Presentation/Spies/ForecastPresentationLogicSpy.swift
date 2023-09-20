//
//  ForecastPresentationLogicSpy.swift
//  WeatherAppTests
//
//  Created by Douglas Moreira on 19/09/23.
//

import WeatherApp

final class ForecastPresentationLogicSpy: ForecastPresentationLogic {
    public private(set) var presentForecastCallCount: Int = 0
    public private(set) var presentForecastTemperaturePassed: Double?

    func presentForecast(with temperature: Double) {
        presentForecastCallCount += 1
        presentForecastTemperaturePassed = temperature
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
