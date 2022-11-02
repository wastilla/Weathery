//
//  ContentView.swift
//  AcademyMP07
//
//  Created by will astilla on 10/26/22.
//

import SwiftUI

struct ContentView: View {
    @State var query: String = ""
    @StateObject var viewModel = WeatherViewModel()
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("Lightblue"), .blue]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack(alignment: .center) {
                    HStack {
                        Text("Weathery")
                            .bold()
                            .font(.system(.largeTitle, design: .rounded))
                            .foregroundColor(.white)
                            
                        Image(systemName: "sun.max")
                            .font(.system(.largeTitle, design: .rounded))
                            .foregroundColor(.yellow)
                    }
                    .padding([.bottom], 200)
                    
                    TextField("Enter a City", text: $query)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .backgroundStyle(.gray)
                        .padding([.leading, .trailing], 40)
                    Button(action: {
                        viewModel.query = self.query
                        Task {
                            await viewModel.fetch2()
                        }
                    }, label: {
                        Text("Search")
                            .bold()
                            .font(.system(.largeTitle, design: .rounded))
                            .foregroundColor(.white)
                    })

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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
