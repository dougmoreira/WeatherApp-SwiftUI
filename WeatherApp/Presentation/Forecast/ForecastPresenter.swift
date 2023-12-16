//
//  ForecastPresenter.swift
//  WeatherApp
//
//  Created by Douglas Moreira on 18/09/23.
//

import Foundation

public protocol ForecastPresentationLogic {
    func presentForecast(with weatherData: WeatherData)
    func presentForecastError()
    func presentLoading()
}

final class ForecastPresenter: ForecastPresentationLogic {
    weak var view: ForecastDisplayLogic?
    
    var weatherData: WeatherData?
    
    func presentForecast(with weatherData: WeatherData) {
        self.weatherData = weatherData
        view?.update(state: .content(weatherData: weatherData))
    }
    
    func presentForecastError() {
        view?.update(state: .error)
    }
    
    func presentLoading() {
        view?.update(state: .loading)
    }
    
}
