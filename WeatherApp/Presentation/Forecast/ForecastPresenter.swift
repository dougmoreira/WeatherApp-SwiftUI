//
//  ForecastPresenter.swift
//  WeatherApp
//
//  Created by Douglas Moreira on 18/09/23.
//

import Foundation

public protocol ForecastPresentationLogic {
    func presentForecast(with weatherData: WeatherDataResponse)
    func presentForecastError()
    func presentLoading()
}

final class ForecastPresenter: ForecastPresentationLogic {
    weak var view: ForecastDisplayLogic?
    
    var weatherData: WeatherViewModel?
    
    func presentForecast(with weatherData: WeatherDataResponse) {
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
            daysOfWeek: time,
            weatherCode: getWeatherSymbols(forWeatherCodes: weatherData.daily.weatherCode ?? [])
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
    
    private func getWeatherSymbols(forWeatherCodes codes: [Int]) -> [String] {
        var symbols: [String] = []
        
        for code in codes {
            var symbolName: String
            switch code {
            case 0:
                symbolName = "sun.max.fill" // Clear sky with a filled sun
            case 1, 2, 3:
                symbolName = "cloud.sun.fill" // Mainly clear, partly cloudy, and overcast with filled cloud
            case 45, 48:
                symbolName = "cloud.fog.fill" // Fog and depositing rime fog with filled cloud
            case 51, 53, 55:
                symbolName = "cloud.drizzle.fill" // Drizzle: Light, moderate, and dense intensity with filled cloud
            case 56, 57:
                symbolName = "cloud.sleet.fill" // Freezing Drizzle: Light and dense intensity with filled cloud
            case 61, 63, 65:
                symbolName = "cloud.rain.fill" // Rain: Slight, moderate and heavy intensity with filled cloud
            case 66, 67:
                symbolName = "cloud.sleet.fill" // Freezing Rain: Light and heavy intensity with filled cloud
            case 71, 73, 75:
                symbolName = "cloud.snow.fill" // Snow fall: Slight, moderate, and heavy intensity with filled cloud
            case 77:
                symbolName = "cloud.snow.fill" // Snow grains with filled cloud
            case 80, 81, 82:
                symbolName = "cloud.heavyrain.fill" // Rain showers: Slight, moderate, and violent with filled cloud
            case 85, 86:
                symbolName = "cloud.snow.fill" // Snow showers slight and heavy with filled cloud
            case 95:
                symbolName = "cloud.bolt.rain.fill" // Thunderstorm: Slight with filled cloud and rain
            case 96, 99:
                symbolName = "cloud.bolt.fill" // Thunderstorm with slight and heavy hail with filled cloud and bolt
            default:
                symbolName = "questionmark.circle.fill" // Default symbol for unknown code
            }
            symbols.append(symbolName)
        }
        
        return symbols
    }
}
