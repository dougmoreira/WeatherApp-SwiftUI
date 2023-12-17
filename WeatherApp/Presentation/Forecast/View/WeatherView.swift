//
//  ForecastView.swift
//  WeatherApp
//
//  Created by Douglas Moreira on 20/09/23.
//

import SwiftUI

enum ViewState {
    case error
    case content(viewModel: WeatherViewModel?)
    case loading
}

struct WeatherView: View {
    @ObservedObject var viewModel: ForecastViewModel
    
    var body: some View {
        ZStack {
            BackgroundView()
            ScrollView {
                VStack {
                    switch viewModel.viewState {
                    case .content(let weatherData):
                        VStack() {
                            WeatherHeaderView(temperature: weatherData?.currentTemperature ?? "-")
                            VStack {
                                ForEach(weatherData?.forecastData ?? [], id: \.self) { temperature in
                                    DayView(
                                        dayName: "SUM",
                                        temperatureMin: temperature[0],
                                        temperatureMax: temperature[1],
                                        imageName: "cloud.sun.fill"
                                    )
                                    .frame(height: 50)
                                }
                            }
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
    
    init(temperature: String) {
        self.temperature = temperature
    }
    
    var body: some View {
        CityNameView(cityName: "Belo Horizonte, MG")
        Image(systemName: "cloud.sun.fill")
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
    WeatherHeaderView(temperature: "30")
}
