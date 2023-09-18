//
//  ViewController.swift
//  WeatherApp
//
//  Created by Douglas Moreira on 18/09/23.
//

import UIKit

protocol ForecastDisplayLogic: AnyObject {
    func displayForecast(with temeprature: Double)
}

class ForecastViewController: UIViewController {
    private let interactor: ForecastBusinessLogic
    
    public init(interactor: ForecastBusinessLogic) {
        self.interactor = interactor
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        interactor.getCurrentForecast()
        super.viewDidLoad()
    }

}

extension ForecastViewController: ForecastDisplayLogic {
    func displayForecast(with teperature: Double) {
        print(teperature)
    }
}

