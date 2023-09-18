//
//  GetForecastService.swift
//  WeatherApp
//
//  Created by Douglas Moreira on 18/09/23.
//

import Foundation
import WeatherModel
import WeatherRepositoryInterface

public final class ForecastRepository: ForecastRepositoryInterfaceProtocol {
    public init() { }
    
    public func getForecast(completionHandler: @escaping (Result<CurrentWeather?, ForecastError>) -> ()) {
        guard let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=-19.9208&longitude=-43.9378&hourly=temperature_2m&current_weather=true&forecast_days=1") else {
            completionHandler(.failure(.invalidURL))
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if error != nil {
                completionHandler(.failure(.error))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completionHandler(.failure(.invalidStatusCode))
                return
            }
            
            guard let data = data else {
                completionHandler(.failure(.invalidData))
                return
            }
            
            let decode = JSONDecoder()
            decode.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let decodedData = try decode.decode(Forecast.self, from: data)
                completionHandler(.success(decodedData.currentWeather))
            } catch {
                completionHandler(.failure(.invalidDecodedData))
            }
            
            
        }
        
        dataTask.resume()
    }

}
