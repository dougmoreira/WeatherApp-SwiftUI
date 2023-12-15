//
//  WeatherErrorView.swift
//  WeatherApp
//
//  Created by Douglas Moreira on 15/12/23.
//

import SwiftUI

struct WeatherErrorView: View {
    var body: some View {
        VStack {
            Text("Error loading forecast data. Try again")
        }
    }
}

#Preview {
    WeatherErrorView()
}
