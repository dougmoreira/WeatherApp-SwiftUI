//
//  ForecastDisplayLogicSpy.swift
//  WeatherAppTests
//
//  Created by Douglas Moreira on 19/09/23.
//

import WeatherApp

final class ForecastDisplayLogicSpy: ForecastDisplayLogic {
    public private(set) var displayForecastCallCount: Int = 0
    public private(set) var displayForecastTemperaturePassed: Double?
    
    func displayForecast(with temperature: Double) {
        displayForecastCallCount += 1
        displayForecastTemperaturePassed = temperature
    }
    
    public private(set) var displayForecastErrorCallCount: Int = 0

    func displayForecastError() {
        displayForecastErrorCallCount += 1
    }
}
