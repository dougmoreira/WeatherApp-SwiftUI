//
//  GetForecast.swift
//  WeatherUseCase
//
//  Created by Douglas Moreira on 18/09/23.
//

public final class GetForecast: GetForecastUseCase {
    private let repository: ForecastRepositoryProtocol
    
    public init(repository: ForecastRepositoryProtocol) {
        self.repository = repository
    }
    
    public func getForecast(completion: @escaping (Result<WeatherData?, ForecastError>) -> ()) {
        repository.getForecast { result in
            completion(result)
        }
    }
}
