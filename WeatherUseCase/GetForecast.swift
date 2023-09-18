//
//  GetForecast.swift
//  WeatherUseCase
//
//  Created by Douglas Moreira on 18/09/23.
//

import WeatherModel
import WeatherRepositoryInterface
import WeatherUseCaseInterface

final class GetForecast: GetForecastUseCase {
    private let repository: ForecastRepositoryInterfaceProtocol
    
    public init(repository: ForecastRepositoryInterfaceProtocol) {
        self.repository = repository
    }
    
    func getForecast(completion: @escaping (Result<CurrentWeather?, ForecastError>) -> ()) {
        repository.getForecast { result in
            completion(result)
        }
    }
}
