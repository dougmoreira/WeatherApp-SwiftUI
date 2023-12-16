//
//  ForecastView.swift
//  WeatherApp
//
//  Created by Douglas Moreira on 20/09/23.
//

import SwiftUI

enum ViewState {
    case error
    case content(weatherData: WeatherData?)
    case loading
}

struct WeatherView: View {
    @ObservedObject var viewModel: ForecastViewModel
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                switch viewModel.viewState {
                case .content(let weatherData):
                    VStack() {
                        CityNameView(cityName: "Belo Horizonte, MG")
                        Image(systemName: "cloud.sun.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 120)
                            .symbolRenderingMode(.multicolor)
                        let formattedTemperature = String(format: "%.0f", weatherData?.current.temperature ?? 0)
                        Text("\(formattedTemperature)°")
                            .foregroundStyle(.white)
                            .font(.system(size: 48))

                        
                        HStack {
                            DayView(dayName: "SEG", temperature: "31", imageName: "cloud.sun.fill")
                            DayView(dayName: "TER", temperature: "30", imageName: "cloud.rain.fill")
                            DayView(dayName: "QUA", temperature: "28", imageName: "cloud.sun.rain.fill")
                            DayView(dayName: "QUI", temperature: "33", imageName: "sun.snow.fill")
                        }
                        
                        Spacer()
                        
                        WeatherButton(title: "Reload") {
                            viewModel.tryAgain()
                        }
                        
                        Spacer()
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
        }
    }
}
