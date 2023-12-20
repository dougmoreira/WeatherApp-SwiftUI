//
//  GetForecast.swift
//  WeatherUseCaseInterface
//
//  Created by Douglas Moreira on 18/09/23.
//

public protocol GetForecastUseCase {
    func getForecast(completion: @escaping (Result<WeatherDataResponse?, ForecastError>) -> ())
}
