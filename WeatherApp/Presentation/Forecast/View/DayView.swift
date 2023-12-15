//
//  DayView.swift
//  WeatherApp
//
//  Created by Douglas Moreira on 15/12/23.
//

import SwiftUI

struct DayView: View {
    private let dayName: String
    private let temperature: String
    private let imageName: String
    
    init(dayName: String, temperature: String, imageName: String) {
        self.dayName = dayName
        self.temperature = temperature
        self.imageName = imageName
    }
    
    var body: some View {
        VStack {
            Text(dayName)
                .font(.system(size: 18))
                .foregroundColor(.white)

            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 48, height: 48)
                .symbolRenderingMode(.multicolor)
            Text(temperature)
                .font(.system(size: 18))
                .foregroundColor(.white)
        }
        .padding()
    }
}
