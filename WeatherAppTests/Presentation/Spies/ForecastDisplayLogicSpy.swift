//
//  ForecastDisplayLogicSpy.swift
//  WeatherAppTests
//
//  Created by Douglas Moreira on 19/09/23.
//

import SwiftUI
@testable import WeatherApp

class ForecastDisplayLogicSpy: UIHostingController<WeatherView> {
    private let state = ForecastState()
    private let interactor: ForecastBusinessLogic = ForecastInteractorSpy()
    
    public private(set) var updateCallCount: Int = 0
    public private(set) var updateStatePassed: ViewState?
    
    public init() {
        let viewStatePublisher = state.$state.eraseToAnyPublisher()
        let forecastView = WeatherView(
            viewModel: .init(
                interactor: interactor, viewStatePublisher: viewStatePublisher
            )
        )
        
        super.init(rootView: forecastView)
        
        
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ForecastDisplayLogicSpy: ForecastDisplayLogic {
    func update(state: ViewState) {
        updateCallCount += 1
        updateStatePassed = state
        
    }
}
