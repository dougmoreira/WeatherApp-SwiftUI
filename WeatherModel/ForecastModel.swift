//
//  WeatherModel.swift
//  WeatherModel
//
//  Created by Douglas Moreira on 18/09/23.
//

public struct Forecast: Decodable {
    public let currentWeather: CurrentWeather
}

public struct CurrentWeather: Decodable {
    public let temperature: Double
}

public enum ForecastError: Error {
    case invalidURL
    case error
    case invalidStatusCode
    case invalidData
    case invalidDecodedData
}
