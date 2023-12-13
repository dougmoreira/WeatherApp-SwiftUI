//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Douglas Moreira on 13/12/23.
//

import SwiftUI

struct WeatherView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack() {
                CityNameView(cityName: "Belo Horizonte, MG")
                Image(systemName: "cloud.sun.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                    .symbolRenderingMode(.multicolor)
                Text("32 C°")
                    .foregroundStyle(.white)
                    .font(.system(size: 48))

                
                HStack {
                    DayView(dayName: "SEG", temperature: "31", imageName: "cloud.sun.fill")
                    DayView(dayName: "TER", temperature: "30", imageName: "cloud.rain.fill")
                    DayView(dayName: "QUA", temperature: "28", imageName: "cloud.sun.rain.fill")
                    DayView(dayName: "QUI", temperature: "33", imageName: "sun.snow.fill")
                }
                
                WeatherButtonView(title: "Change Day Time") {
                    print("hi")
                }
                
                Spacer()
            }
        }
    }
}

struct WeatherButtonView: View {
    private let title: String
    private let action: () -> Void
    
    init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(title)
                .font(.system(size: 24))
        })
        .frame(width: 300 ,height: 50)
        .background(Color.white)
        .cornerRadius(10)
        .padding()
    }
}

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
    WeatherView()
}
