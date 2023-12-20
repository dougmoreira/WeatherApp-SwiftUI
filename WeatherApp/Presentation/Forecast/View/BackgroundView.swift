//
//  BackgroundView.swift
//  WeatherApp
//
//  Created by Douglas Moreira on 15/12/23.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ContainerRelativeShape()
            .fill(Color.black.gradient)
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView()
}
