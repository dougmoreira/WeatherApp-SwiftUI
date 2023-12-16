//
//  ForecastRepositoryInterfaceProtocol.swift
//  WeatherRepositoryInterface
//
//  Created by Douglas Moreira on 18/09/23.
//

public protocol ForecastRepositoryProtocol {
    func getForecast(completionHandler: @escaping (Result<WeatherData?, ForecastError>) -> () )
}
