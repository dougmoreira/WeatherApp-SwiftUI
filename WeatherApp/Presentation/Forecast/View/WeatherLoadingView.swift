//
//  WeatherLoadingView.swift
//  WeatherApp
//
//  Created by Douglas Moreira on 15/12/23.
//

import SwiftUI

struct WeatherLoadingView: View {
    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(.circular)
        }
    }
}

#Preview {
    WeatherLoadingView()
}
