//
//  ViewController.swift
//  WeatherApp
//
//  Created by Douglas Moreira on 18/09/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let service = GetForecastService()
        
        service.getForecast { result in
            switch result {
            case .success(let success):
                print(success?.temperature)
            case .failure(let failure):
                print(failure)
            }
        }
    }


}

