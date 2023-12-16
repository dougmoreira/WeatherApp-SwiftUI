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
        presenter.presentLoading()
        getForecast.getForecast { [weak self] result in
            switch result {
            case .success(let weatherData):
                if let weatherData = weatherData {
                    self?.presenter.presentForecast(with: weatherData)
                    
                } else {
                    self?.presenter.presentForecastError()
                }
            case .failure:
                self?.presenter.presentForecastError()
            }
        }
    }
}
