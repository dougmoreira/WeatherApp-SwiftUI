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
        VStack {
            switch viewModel.viewState {
            case .content(let temperature):
                TemperatureView(temperature: temperature)
            case .error:
                ForecastErrorView()
            case .loading:
                ForecastLoadingView()
            }
        }
    }
}

struct TemperatureViewLegacy: View {
    @ObservedObject var viewModel: ForecastViewModel
    var temperature: Double
    
    var body: some View {
        VStack {
            Text(String(format: "%.2f", temperature))
                .font(.largeTitle)
            Button {
                viewModel.tryAgain()
            } label: {
                Text("try again")
            }

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

struct ForecastLoadingView: View {
    var body: some View {
        VStack {
            ProgressView()
        }
    }
}

struct TemperatureView: View {
    var temperature: Double

    @State private var items: [CarouselItem] = [
        .init(color: .red, title: "Belo Horizonte", subTitle: "Predominantemente nublado"),
        .init(color: .blue, title: "São Paulo", subTitle: "Predominantemente Limpo"),
    ]

    var body: some View {
        VStack {
            CarouselView(
                data: $items
            ) { $item in
                RoundedRectangle(cornerRadius: 15)
                    .fill(item.color.gradient)
                    .frame(width: nil, height: 220)
            } titleContent: { $item in
                VStack(spacing: 5) {
                    Text(item.title)
                        .font(.largeTitle.bold())
                    
                    Text(item.subTitle)
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.center)
                        .frame(height: 45)
                }
                .padding(.bottom, 35)
            }
            .safeAreaPadding([.horizontal, .top], 35)
            
        }
    }
}
