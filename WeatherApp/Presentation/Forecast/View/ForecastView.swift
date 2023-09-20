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
}

struct ForecastView: View {
    @ObservedObject var viewModel: ForecastViewModel
    
    var body: some View {
        VStack {
            switch viewModel.viewState {
            case .content(let temperature):
                TemperatureView(viewModel: viewModel, temperature: temperature)
            case .error:
                ForecastErrorView()
            }
        }
    }
}

struct TemperatureView: View {
    @ObservedObject var viewModel: ForecastViewModel
    var temperature: Double
    
    var body: some View {
        VStack {
            Text("\(temperature)")
        }
    }
}

struct ForecastErrorView: View {
    var body: some View {
        VStack {
            Text("Error loading forecast data. Try again")
        }
    }
}
