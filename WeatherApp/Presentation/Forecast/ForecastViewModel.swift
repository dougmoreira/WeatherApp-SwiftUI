//
//  ForecastViewModel.swift
//  WeatherApp
//
//  Created by Douglas Moreira on 20/09/23.
//

import Combine

class ForecastViewModel: ObservableObject {
    @Published var viewState = ViewState.content(temperature: 0)
    
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
    
    func onAppear() {
        interactor.getCurrentForecast()
    }
}
