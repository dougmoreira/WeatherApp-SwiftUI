//
//  ViewController.swift
//  WeatherApp
//
//  Created by Douglas Moreira on 18/09/23.
//

import UIKit

public protocol ForecastDisplayLogic: AnyObject {
    func displayForecast(with temperature: Double)
    func displayForecastError()
}

class ForecastViewController: UIViewController {
    private let interactor: ForecastBusinessLogic
    
    public init(interactor: ForecastBusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
        
        self.view.backgroundColor = .systemGray
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
        label.textColor = .systemOrange
        label.font = .systemFont(ofSize: 64)
        return label
    }()

}

extension ForecastViewController: ForecastDisplayLogic {
    func displayForecast(with temperature: Double) {
        DispatchQueue.main.async { [weak self] in
            self?.temperatureLabel.text = "\(temperature)C°"
        }
    }
    
    func displayForecastError() {
        DispatchQueue.main.async { [weak self] in
            self?.temperatureLabel.text = "No Data to display"
        }
    }
}

