//
//  ViewController.swift
//  WeatherApp
//
//  Created by Douglas Moreira on 18/09/23.
//

import UIKit

class ViewController: UIViewController {
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

