//
//  DayView.swift
//  WeatherApp
//
//  Created by Douglas Moreira on 15/12/23.
//

import SwiftUI

struct DayView: View {
    private let date: String
    private let temperatureMin: Double
    private let temperatureMax: Double
    private let imageName: String
    
    init(date: String, temperatureMin: Double, temperatureMax: Double, imageName: String) {
        self.date = date
        self.temperatureMin = temperatureMin
        self.temperatureMax = temperatureMax
        self.imageName = imageName
    }
    
    
    var body: some View {
        HStack {
            Text(dayOfWeekAbbreviation(from: date))
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
    
    private func dayOfWeekAbbreviation(from dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = dateFormatter.date(from: dateString) {
            let dayFormatter = DateFormatter()
            dayFormatter.dateFormat = "E" //
            return dayFormatter.string(from: date)
        } else {
            return "Invalid Date"
        }
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
    DayView(date: "2023-12-17", temperatureMin: 22, temperatureMax: 30, imageName: "cloud.hail")
    
}
