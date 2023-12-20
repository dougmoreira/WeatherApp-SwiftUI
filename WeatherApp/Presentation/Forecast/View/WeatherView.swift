//
//  ForecastView.swift
//  WeatherApp
//
//  Created by Douglas Moreira on 20/09/23.
//

import SwiftUI

enum ViewState {
    case error
    case content(content: WeatherViewInfo?)
    case loading
}

struct WeatherView: View {
    @ObservedObject var viewModel: ForecastViewModel
    private let columns: [GridItem] = [GridItem(.flexible())]
    
    var body: some View {
        ZStack {
            BackgroundView()
            ScrollView {
                VStack {
                    switch viewModel.viewState {
                    case .content(let weatherData):
                        VStack() {
                            WeatherHeaderView(
                                temperature: weatherData?.currentTemperature ?? "-",
                                currentWeatherCode: weatherData?.weatherCode.first ?? ""
                            )
                            LazyVGrid(columns: columns, spacing: 16, content: {
                                ForEach(weatherData?.daysOfWeek ?? [], id: \.self) { date in
                                    if let index = weatherData?.daysOfWeek.firstIndex(of: date) {
                                        let temperature = weatherData?.forecastData[index] ?? []
                                        
                                        DayView(
                                            date: date,
                                            temperatureMin: temperature[0],
                                            temperatureMax: temperature[1],
                                            imageName: weatherData?.weatherCode[index] ?? ""
                                        )
                                        .frame(height: 50)
                                    }
                                }
                            })
                            .padding(.top, 24)
                        }
                    case .error:
                        WeatherErrorView()
                        WeatherButton(title: "Try again") {
                            viewModel.tryAgain()
                        }
                    case .loading:
                        WeatherLoadingView()
                    }
                }
            }.refreshable {
                viewModel.tryAgain()
            }
        }
    }
}

struct WeatherHeaderView: View {
    private let temperature: String
    private let currentWeatherCode: String
    
    init(temperature: String, currentWeatherCode: String) {
        self.temperature = temperature
        self.currentWeatherCode = currentWeatherCode
    }
    
    var body: some View {
        CityNameView(cityName: "Belo Horizonte, MG")
        Image(systemName: currentWeatherCode)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 120, height: 120)
            .symbolRenderingMode(.multicolor)
            .padding(-8)
        Text("\(temperature)°")
            .foregroundStyle(.white)
            .font(.system(size: 48))
            .padding(-8)
        
    }
}

#Preview {
    WeatherHeaderView(temperature: "30", currentWeatherCode: "cloud.bolt.fill")
}
