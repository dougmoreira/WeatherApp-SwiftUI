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
    
    var weatherData: WeatherViewModel?
    
    func presentForecast(with weatherData: WeatherData) {
        guard let tempMin = weatherData.daily.temperatureMin,
              let tempMax = weatherData.daily.temperatureMax,
              let time = weatherData.daily.time else {
            view?.update(state: .error)
            return
        }
                
        let viewModel: WeatherViewModel = .init(
            currentTemperature: String(format: "%.0f", weatherData.current.temperature),
            forecastData: handleForecastData(
                temperatureMin: tempMin,
                temperatureMax: tempMax),
            daysOfWeek: time
        )
        
        self.weatherData = viewModel
        
        view?.update(state: .content(viewModel: viewModel))
    }
    
    func presentForecastError() {
        view?.update(state: .error)
    }
    
    func presentLoading() {
        view?.update(state: .loading)
    }
    
}

extension ForecastPresenter {
    private func handleForecastData(temperatureMin: [Double], temperatureMax: [Double]) -> [[Double]] {
        guard temperatureMin.count == temperatureMax.count else {
            return []
        }

        var combinedArray: [[Double]] = []

        for (min, max) in zip(temperatureMin, temperatureMax) {
            combinedArray.append([min, max])
        }

        return combinedArray
    }
}
