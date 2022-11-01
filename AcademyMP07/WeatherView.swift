//
//  WeatherView.swift
//  AcademyMP07
//
//  Created by will astilla on 10/31/22.
//

import Foundation
import SwiftUI

struct WeatherView: View {
    @Binding var query: String
    @StateObject var viewModel = WeatherViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("Lightblue"), .blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Text(viewModel.weather?.name ?? "none")
                    .font(.system(.largeTitle, design: .rounded))
                    .foregroundColor(.white)
                    .bold()
                Text(viewModel.description)
                    .font(.system(.title2, design: .rounded))
                    .foregroundColor(.white)
                 
                Image(systemName: viewModel.weatherIcon)
                    .font(.system(.largeTitle, design: .rounded))
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                Text(viewModel.temperature)
                    .font(.system(.largeTitle, design: .rounded))
                    .foregroundColor(.white)
                    .bold()
                
                HStack {
                    Text("high: \(viewModel.lowTemp)")
                        .font(.system(.title2, design: .rounded))
                        .foregroundColor(.white)
                    Text("low: \(viewModel.highTemp)")
                        .font(.system(.title2, design: .rounded))
                        .foregroundColor(.white)
                }
                .padding()
            }
        }
        .onAppear{
            viewModel.query = self.query
        }
        .task {
            await viewModel.fetch2()
        }
    }
}

