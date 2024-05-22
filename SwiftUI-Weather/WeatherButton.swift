//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Yashavika Singh on 22.05.24.
//

import SwiftUI

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    var body: some View {
        Text(title)
            .frame(width: 280, height: 40)
            .font(.system(size: 20, weight: .bold))
            .foregroundColor(textColor)
            .background(backgroundColor)
            .cornerRadius(10)
    }
        
}

