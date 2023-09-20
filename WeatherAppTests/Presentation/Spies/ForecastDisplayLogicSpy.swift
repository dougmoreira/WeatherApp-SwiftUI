//
//  ForecastDisplayLogicSpy.swift
//  WeatherAppTests
//
//  Created by Douglas Moreira on 19/09/23.
//

import WeatherApp

final class ForecastDisplayLogicSpy: ForecastDisplayLogic {
    
    public private(set) var updateCallCount: Int = 0
    public private(set) var updateStatePassed: ViewState?
    
    func update(state: ViewState) {
        updateCallCount += 1
        updateStatePassed = state
        
    }
    
    public init() {}
}
