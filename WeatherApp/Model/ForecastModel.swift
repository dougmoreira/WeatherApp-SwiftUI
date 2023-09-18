//
//  ForecastModel.swift
//  WeatherApp
//
//  Created by Douglas Moreira on 18/09/23.
//

struct Forecast: Decodable {
    let currentWeather: CurrentWeather
}

struct CurrentWeather: Decodable {
    let temperature: Double
}

enum ForecastError: Error {
    case invalidURL
    case error
    case invalidStatusCode
    case invalidData
    case invalidDecodedData
    
}
