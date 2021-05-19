//
//  WeatherButton.swift
//  WeatherApp
//
//  Created by Keven Qiu on 2021-05-16.
//

import SwiftUI

struct changeTimeButton: View {
    
    var text: String
    var textColour: Color
    var bkgColour: Color
    
    var body: some View {
        Text(text)
            .frame(width: 280, height: 50)
            .background(bkgColour)
            .foregroundColor(textColour)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}
