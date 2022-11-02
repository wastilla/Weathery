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
                
                Text(viewModel.temperature)
                    .font(.system(size: 100))
                    .foregroundColor(.white)
                    .bold()
                    
                HStack {
                    Text("high: \(viewModel.highTemp)")
                        .font(.system(.title2, design: .rounded))
                        .foregroundColor(.white)
                    Text("low: \(viewModel.lowTemp)")
                        .font(.system(.title2, design: .rounded))
                        .foregroundColor(.white)
                }
                
                Image(systemName: viewModel.weatherIcon)
                    .font(.system(size: 75, design: .rounded))
                    .foregroundColor(.white)
                    .bold()
                    .padding([.top])
                Text(viewModel.description)
                    .font(.system(.title2, design: .rounded))
                    .foregroundColor(.white)
                    .padding([.bottom], 5)
            }
        }
        .onAppear {
            viewModel.query = self.query
        }
        .task {
            await viewModel.fetch2()
        }
    }
}
