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
                let items = [
                    CarouselItem(color: .red, title: "Belo Horizonte", subTitle: "Predominantemente nublado", temperature: temperature),
                    CarouselItem(color: .blue, title: "São Paulo", subTitle: "Predominantemente Limpo", temperature: temperature),
                ]
                TemperatureView(items: items)
                Spacer()
                Button {
                    viewModel.tryAgain()
                } label: {
                    Text("Reload")
                }
            case .error:
                ForecastErrorView()
                Button {
                    viewModel.tryAgain()
                } label: {
                    Text("try again")
                }
            case .loading:
                ForecastLoadingView()
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
    @State var items: [CarouselItem]

    var body: some View {
        VStack {
            CarouselView(
                data: $items
            ) { $item in
                RoundedRectangle(cornerRadius: 15)
                .fill(item.color.gradient)
                .frame(width: nil, height: 220)
                .overlay {
                    Text(String(format: "%.2f", item.temperature))
                        .font(.largeTitle)
                }
                
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
