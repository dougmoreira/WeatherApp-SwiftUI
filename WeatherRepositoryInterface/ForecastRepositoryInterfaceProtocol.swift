//
//  ForecastRepositoryInterfaceProtocol.swift
//  WeatherRepositoryInterface
//
//  Created by Douglas Moreira on 18/09/23.
//

import WeatherModel

public protocol ForecastRepositoryInterfaceProtocol {
    func getForecast(completionHandler: @escaping (Result<CurrentWeather?, ForecastError>) -> () )
}
