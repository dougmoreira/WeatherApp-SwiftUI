//
//  ViewController.swift
//  WeatherApp
//
//  Created by Douglas Moreira on 18/09/23.
//

import UIKit

protocol ForecastDisplayLogic: AnyObject {
    func displayForecast(with temperature: Double)
}

class ForecastViewController: UIViewController {
    private let interactor: ForecastBusinessLogic
    
    public init(interactor: ForecastBusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
        
        self.view.addSubview(stack)
        
        stack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stack.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        interactor.getCurrentForecast()
        super.viewDidLoad()
    }
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [temperatureLabel])
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

}

extension ForecastViewController: ForecastDisplayLogic {
    func displayForecast(with temperature: Double) {
        DispatchQueue.main.async { [weak self] in
            self?.temperatureLabel.text = "\(temperature)"
        }
    }
}

