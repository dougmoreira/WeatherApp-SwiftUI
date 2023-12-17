//
//  DayView.swift
//  WeatherApp
//
//  Created by Douglas Moreira on 15/12/23.
//

import SwiftUI

struct DayView: View {
    private let dayName: String
    private let temperatureMin: Double
    private let temperatureMax: Double
    private let imageName: String
    
    init(dayName: String, temperatureMin: Double, temperatureMax: Double, imageName: String) {
        self.dayName = dayName
        self.temperatureMin = temperatureMin
        self.temperatureMax = temperatureMax
        self.imageName = imageName
    }
    
    
    var body: some View {
        HStack {
            Text(dayName)
                .font(.system(size: 16))
                .foregroundColor(.white)
                .padding()
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 48, height: 48)
                .symbolRenderingMode(.multicolor)
                .padding()
            TemperatureView(temperature: temperatureMin, isTemperatureMin: true)
            TemperatureView(temperature: temperatureMax, isTemperatureMin: false)
        }
        .padding()
    }
}

struct TemperatureView: View {
    private let temperature: Double
    private let isTemperatureMin: Bool
    
    init(temperature: Double, isTemperatureMin: Bool) {
        self.temperature = temperature
        self.isTemperatureMin = isTemperatureMin
    }
    
    var body: some View {
        Image(systemName: isTemperatureMin ? "arrowshape.down.fill" : "arrowshape.up.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 18, height: 18)
            .symbolRenderingMode(.monochrome)
        Text("\(String(format: "%.0f", temperature))°")
            .font(.system(size: 16))
            .foregroundColor(.white)
            .padding()
    }
}

#Preview {
    DayView(dayName: "SUM", temperatureMin: 22, temperatureMax: 30, imageName: "cloud.hail")
    
}
