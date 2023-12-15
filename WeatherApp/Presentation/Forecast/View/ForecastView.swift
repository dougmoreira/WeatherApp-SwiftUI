//
//  ForecastView.swift
//  WeatherApp
//
//  Created by Douglas Moreira on 20/09/23.
//

import SwiftUI

enum ViewState {
    case error
    case content(temperature: Double)
    case loading
}

struct ForecastView: View {
    @ObservedObject var viewModel: ForecastViewModel
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                switch viewModel.viewState {
                case .content(let temperature):
                    VStack() {
                        CityNameView(cityName: "Belo Horizonte, MG")
                        Image(systemName: "cloud.sun.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 120)
                            .symbolRenderingMode(.multicolor)
                        let formattedTemperature = String(format: "%.0f", temperature)
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
                        
                        WheaterButton(title: "Reload") {
                            viewModel.tryAgain()
                        }
                        
                        Spacer()
                    }
                case .error:
                    WeatherErrorView()
                    WheaterButton(title: "Try again") {
                        viewModel.tryAgain()
                    }
                case .loading:
                    WeatherLoadingView()
                }
            }
            
        }
    }
}

struct WeatherErrorView: View {
    var body: some View {
        VStack {
            Text("Error loading forecast data. Try again")
        }
    }
}

struct WeatherLoadingView: View {
    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(.circular)
        }
    }
}

struct BackgroundView: View {
    var body: some View {
        ContainerRelativeShape()
            .fill(Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct WheaterButton: View {
    private let title: String
    private let action: () -> Void
    
    init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Text("Reload")
                .font(.system(size: 24))
                .frame(width: 350, height: 50)
                .background(Color.white.gradient)
                .cornerRadius(12)
        }

    }
}
