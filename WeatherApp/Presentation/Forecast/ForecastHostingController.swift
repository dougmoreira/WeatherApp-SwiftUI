//
//  ViewController.swift
//  WeatherApp
//
//  Created by Douglas Moreira on 18/09/23.
//

import SwiftUI

protocol ForecastDisplayLogic: UIViewController {
    func update(state: ViewState)
}

class ForecastState: ObservableObject {
    @Published var state: ViewState = .content(temperature: 0)
}

class ForecastHostingController: UIHostingController<WeatherView> {
    private let state = ForecastState()
    
    private let interactor: ForecastBusinessLogic
    
    public init(interactor: ForecastBusinessLogic) {
        self.interactor = interactor
        
        let viewStatePublisher = state.$state.eraseToAnyPublisher()
        let forecastView = WeatherView(
            viewModel: .init(
                interactor: interactor, viewStatePublisher: viewStatePublisher
            )
        )
        
        super.init(rootView: forecastView)
        
        
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        nil
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor.getCurrentForecast()
    }

}

extension ForecastHostingController: ForecastDisplayLogic {
    func update(state: ViewState) {
        DispatchQueue.main.async { [weak self] in
            self?.state.state = state
        }
    }
}

