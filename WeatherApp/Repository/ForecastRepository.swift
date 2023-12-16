//
//  GetForecastService.swift
//  WeatherApp
//
//  Created by Douglas Moreira on 18/09/23.
//

import Foundation

public final class ForecastRepository: ForecastRepositoryProtocol {
    public init() { }
    
    public func getForecast(completionHandler: @escaping (Result<WeatherData?, ForecastError>) -> ()) {
        guard let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=-19.9208&longitude=-43.9378&current=temperature_2m,is_day,weather_code&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=auto") else {
            completionHandler(.failure(.invalidURL))
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if error != nil {
                completionHandler(.failure(.error))
                return
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
            
            do {
                let decodedData = try decode.decode(WeatherData.self, from: data)
                completionHandler(.success(decodedData))
            } catch {
                completionHandler(.failure(.invalidDecodedData))
            }
            
        }
        
        dataTask.resume()
    }

}
