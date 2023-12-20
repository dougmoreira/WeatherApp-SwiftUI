//
//  ForecastRepositoryProtocolSpy.swift
//  WeatherAppTests
//
//  Created by Douglas Moreira on 19/09/23.
//

import Foundation
import WeatherApp

public final class ForecastRepositoryProtocolSpy: ForecastRepositoryProtocol {
    
    public var getForecastCallCount: Int = 0
    public var getForecastCompletionToBeReturned: Result<WeatherDataResponse?, ForecastError>?
    
    public func getForecast(completionHandler: @escaping (Result<WeatherDataResponse?, ForecastError>) -> ()) {
        getForecastCallCount += 1
        
        if let getForecastCompletionToBeReturned {
            completionHandler(getForecastCompletionToBeReturned)
        }
    }
    
    public init() {}
}
