//
//  ForecastViewModel.swift
//  WeatherApp
//
//  Created by Douglas Moreira on 20/09/23.
//

import Combine

final class ForecastViewModel: ObservableObject {
    @Published var viewState = ViewState.content(weatherData: nil)
    
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
