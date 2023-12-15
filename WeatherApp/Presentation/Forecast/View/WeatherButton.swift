//
//  WeatherButton.swift
//  WeatherApp
//
//  Created by Douglas Moreira on 15/12/23.
//

import SwiftUI

struct WeatherButton: View {
    private let title: String
    private let action: () -> Void
    
    init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Text("Reload")
                .font(.system(size: 24))
                .frame(width: 350, height: 50)
                .background(Color.white.gradient)
                .cornerRadius(12)
        }

    }
}

#Preview {
    WeatherButton(title: "Button Title", action: {})
}
