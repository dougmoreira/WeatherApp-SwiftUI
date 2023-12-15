//
//  CityNameView.swift
//  WeatherApp
//
//  Created by Douglas Moreira on 15/12/23.
//

import SwiftUI

struct CityNameView: View {
    private let cityName: String
    
    init(cityName: String) {
        self.cityName = cityName
    }
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 24))
            .foregroundColor(.white)
            .padding(24)
    }
}

#Preview {
    CityNameView(cityName: "Belo Horizonte")
}
