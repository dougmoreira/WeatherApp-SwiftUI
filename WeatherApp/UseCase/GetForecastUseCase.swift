//
//  GetForecastUseCase.swift
//  WeatherApp
//
//  Created by Douglas Moreira on 18/09/23.
//

import Foundation
import WeatherModel

protocol GetForecastUseCase {
    func getForecast(completion: @escaping (ForecastResult) -> ())
}

final class GetForecast: GetForecastUseCase {
    private let repository: ForecastRepositoryProtocol
    
    public init(repository: ForecastRepositoryProtocol) {
        self.repository = repository
    }
    
    func getForecast(completion: @escaping (ForecastResult) -> ()) {
        repository.getForecast { result in
            completion(result)
        }
    }
}
