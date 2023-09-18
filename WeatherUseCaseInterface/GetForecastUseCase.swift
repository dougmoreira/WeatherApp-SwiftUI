//
//  GetForecast.swift
//  WeatherUseCaseInterface
//
//  Created by Douglas Moreira on 18/09/23.
//

import WeatherModel

public protocol GetForecastUseCase {
    func getForecast(completion: @escaping (Result<CurrentWeather?, ForecastError>) -> ())
}
