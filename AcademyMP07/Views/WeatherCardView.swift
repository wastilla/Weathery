//
//  WeatherCardView.swift
//  AcademyMP07
//
//  Created by will astilla on 11/2/22.
//

import Foundation

import SwiftUI

struct WeatherCardView: View {
    let name: String?
    let temperature: String?
    let highTemp: String?
    let lowTemp: String?
    let weatherIcon: String?
    let description: String?

    
    var body: some View {
        Text(name ?? "none")
            .font(.system(.largeTitle, design: .rounded))
            .foregroundColor(.white)
            .bold()
        
        Text(temperature ?? "N/A")
            .font(.system(size: 100))
            .foregroundColor(.white)
            .bold()
            
        HStack {
            Text("high: " + (highTemp ?? "N/A"))
                .font(.system(.title2, design: .rounded))
                .foregroundColor(.white)
            Text("low: " + (lowTemp ?? "N/A"))
                .font(.system(.title2, design: .rounded))
                .foregroundColor(.white)
        }
        
        Image(systemName: weatherIcon ?? "")
            .font(.system(size: 75, design: .rounded))
            .foregroundColor(.white)
            .bold()
            .padding([.top])
        Text(description ?? "N/A")
            .font(.system(.title2, design: .rounded))
            .foregroundColor(.white)
            .padding([.bottom], 5)
    }
}
