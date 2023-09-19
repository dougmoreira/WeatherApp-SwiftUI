//
//  ForecastRepositoryInterfaceProtocol.swift
//  WeatherRepositoryInterface
//
//  Created by Douglas Moreira on 18/09/23.
//

public protocol ForecastRepositoryInterfaceProtocol {
    func getForecast(completionHandler: @escaping (Result<CurrentWeather?, ForecastError>) -> () )
}
