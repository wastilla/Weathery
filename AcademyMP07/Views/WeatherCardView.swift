//
//  WeatherCardView.swift
//  AcademyMP07
//
//  Created by will astilla on 11/2/22.
//

import Foundation

import SwiftUI

struct WeatherCardView: View {
    @ObservedObject var viewModel: WeatherViewModel
    let weather: Weather

   
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
            VStack {
                Text(weather.name ?? "none")
                    .font(.system(.largeTitle, design: .rounded))
                    .foregroundColor(.white)
                    .bold()
                
                Text("\(Int(weather.main?.temp?.toFahrenheit() ?? -300)) F")
                    .font(.system(size: 100))
                    .foregroundColor(.white)
                    .bold()
                    
                HStack {
                    Text("high:  \(Int(weather.main?.tempMax?.toFahrenheit() ?? -300))")
                        .font(.system(.title2, design: .rounded))
                        .foregroundColor(.white)
                    Text("low:  \(Int(weather.main?.tempMin?.toFahrenheit() ?? -300))")
                        .font(.system(.title2, design: .rounded))
                        .foregroundColor(.white)
                }
                
                Image(systemName: viewModel.getWeatherIcon(description: weather.weather?[0].weatherDescription ?? ""))
                    .font(.system(size: 75, design: .rounded))
                    .foregroundColor(.white)
                    .bold()
                    .padding([.top])
                Text(weather.weather?[0].weatherDescription ?? "N/A")
                    .font(.system(.title2, design: .rounded))
                    .foregroundColor(.white)
                    .padding([.bottom], 5)
            }
            .frame(width: 300, height: 200)
        }
        .cornerRadius(10)
    }
}
