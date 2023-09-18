//
//  ForecastConfigurator.swift
//  WeatherApp
//
//  Created by Douglas Moreira on 18/09/23.
//

import WeatherRepository
import UIKit

protocol ForecastConfiguratorProtocol {
    func resolveViewController() -> UIViewController
}

final class ForecastConfigurator: ForecastConfiguratorProtocol {
    func resolveViewController() -> UIViewController {
        let presenter = ForecastPresenter()
        
        let forecastRepository = ForecastRepository()
        let getForecastUseCase = GetForecast(repository: forecastRepository)
        
        let interactor = ForecastInteractor(
            presenter: presenter,
            getForecast: getForecastUseCase
        )
        
        let viewController = ForecastViewController(interactor: interactor)
        
        presenter.viewController = viewController
        
        return viewController
    }
    
}
