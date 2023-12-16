//
//  WeatherModel.swift
//  WeatherModel
//
//  Created by Douglas Moreira on 18/09/23.
//

public struct WeatherData: Decodable {
    let current: CurrentInfo
    let daily: DailyInfo
    
    enum CodingKeys: String, CodingKey {
        case current
        case daily
    }
}

public struct CurrentInfo: Decodable {
    let temperature: Double
    let isDay: Int?
    let weatherCode: Int?
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temperature_2m"
        case isDay = "is_day"
        case weatherCode = "weather_code"
    }
}

public struct DailyInfo: Decodable {
    let weatherCode: [Int]?
    let temperatureMax: [Double]?
    let temperatureMin: [Double]?
    
    enum CodingKeys: String, CodingKey {
        case weatherCode = "weather_code"
        case temperatureMax = "temperature_2m_max"
        case temperatureMin = "temperature_2m_min"
    }
}

public enum ForecastError: Error {
    case invalidURL
    case error
    case invalidStatusCode
    case invalidData
    case invalidDecodedData
}
