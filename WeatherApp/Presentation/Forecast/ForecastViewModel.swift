//
//  ForecastViewModel.swift
//  WeatherApp
//
//  Created by Douglas Moreira on 20/09/23.
//

import Combine

public struct WeatherViewModel {
    let currentTemperature: String
    let forecastData: [[Double]]
    let daysOfWeek: [String]
    let weatherCode: [String]
    
    init(currentTemperature: String, forecastData: [[Double]], daysOfWeek: [String], weatherCode: [String]) {
        self.currentTemperature = currentTemperature
        self.forecastData = forecastData
        self.daysOfWeek = daysOfWeek
        self.weatherCode = weatherCode
    }
}

final class ForecastViewModel: ObservableObject {
    @Published var viewState = ViewState.content(viewModel: nil)
    
    private let interactor: ForecastBusinessLogic
    private var viewStatePublisherCancellable: AnyCancellable?
    
    init(
        interactor: ForecastBusinessLogic,
        viewStatePublisher: AnyPublisher<ViewState, Never>
    ) {
        self.interactor = interactor
        self.viewStatePublisherCancellable = viewStatePublisher
            .sink { [weak self] viewState in
                self?.viewState = viewState
                
            }
    }
    
    func tryAgain() {
        interactor.getCurrentForecast()
    }
}
