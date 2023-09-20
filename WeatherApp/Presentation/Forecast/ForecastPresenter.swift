//
//  ForecastPresenter.swift
//  WeatherApp
//
//  Created by Douglas Moreira on 18/09/23.
//

import Foundation

public protocol ForecastPresentationLogic {
    func presentForecast(with temperature: Double)
    func presentForecastError()
    func presentLoading()
}

final class ForecastPresenter: ForecastPresentationLogic {
    weak var view: ForecastDisplayLogic?
    
    var temperature: Double = 0
    
    func presentForecast(with temperature: Double) {
        self.temperature = temperature
        view?.update(state: .content(temperature: temperature))
    }
    
    func presentForecastError() {
        view?.update(state: .error)
    }
    
    func presentLoading() {
        view?.update(state: .loading)
    }
    
}
