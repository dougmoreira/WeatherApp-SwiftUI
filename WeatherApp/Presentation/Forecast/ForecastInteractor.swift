//
//  ForecastInteractor.swift
//  WeatherApp
//
//  Created by Douglas Moreira on 18/09/23.
//

import Foundation

public protocol ForecastBusinessLogic {
    func getCurrentForecast()
}

final class ForecastInteractor {
    private let getForecast: GetForecastUseCase
    private let presenter: ForecastPresentationLogic
    
    public init(
        presenter: ForecastPresentationLogic,
        getForecast: GetForecastUseCase
    ) {
        self.presenter = presenter
        self.getForecast = getForecast
    }
    
}

extension ForecastInteractor: ForecastBusinessLogic {
    func getCurrentForecast() {
        getForecast.getForecast { [weak self] result in
            switch result {
            case .success(let currentWeather):
                if let temperature = currentWeather?.temperature {
                    self?.presenter.presentForecast(with: temperature)
                    
                }
            case .failure:
                self?.presenter.presentForecastError()
            }
        }
    }
}
