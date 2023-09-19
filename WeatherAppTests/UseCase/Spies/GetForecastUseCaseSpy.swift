//
//  GetForecastUseCaseSpy.swift
//  WeatherAppTests
//
//  Created by Douglas Moreira on 19/09/23.
//

import Foundation
import WeatherApp

final class GetForecastUseCaseSpy: GetForecastUseCase {
    
    public private(set) var getForecastCallCount: Int = 0
    public var getForecastCompletionToBeReturned: Result<CurrentWeather?, ForecastError>?
    
    func getForecast(completion completionHandler: @escaping (Result<CurrentWeather?, ForecastError>) -> ()) {
        getForecastCallCount += 1
        
        if let getForecastCompletionToBeReturned {
            completionHandler(getForecastCompletionToBeReturned)
        }
    }
    
    public init() {}
}
