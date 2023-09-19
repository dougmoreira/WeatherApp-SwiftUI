//
//  ForecastInteractorSpy.swift
//  WeatherAppTests
//
//  Created by Douglas Moreira on 19/09/23.
//

import WeatherApp

final class ForecastInteractorSpy: ForecastBusinessLogic {
    public init() { }
    
    public private(set) var getCurrentForecastCallCount: Int = 0
    
    func getCurrentForecast() {
        getCurrentForecastCallCount += 1
    }
}
