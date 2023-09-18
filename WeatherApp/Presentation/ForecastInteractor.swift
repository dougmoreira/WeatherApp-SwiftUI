//
//  ForecastInteractor.swift
//  WeatherApp
//
//  Created by Douglas Moreira on 18/09/23.
//

import Foundation

protocol ForecastBusinessLogic {
    func getCurrentForecast()
}
final class ForecastInteractor {
    private let getForecast: GetForecastUseCase
    
    public init(getForecast: GetForecastUseCase) {
        self.getForecast = getForecast
    }
    
}

extension ForecastInteractor: ForecastBusinessLogic {
    func getCurrentForecast() {
        getForecast.getForecast { result in
            switch result {
            case .success(let currentWeather):
                debugPrint(currentWeather?.temperature)
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
