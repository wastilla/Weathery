//
//  ContentView.swift
//  AcademyMP07
//
//  Created by will astilla on 10/26/22.
//

import SwiftUI

struct ContentView: View {
    @State var query: String = ""
    @State private var showingSheet = false
    @State var citiesList: [String] = []
    
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
                            .bold()
                        
                        Spacer()
                        
                        Button(action: {
                            showingSheet.toggle()
                        }) {
                            Image(systemName: "plus")
                                .font(.system(.title))
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                    .padding([.bottom], 200)
                    .padding([.leading, .trailing], 20)
                    
                    if viewModel.cities.count != 0 {
                        ForEach(viewModel.cities, id: \.self) { city in
                            Text(city)
                        }
                    } else {
                        Text("Nothin")
                    }
                    
                    /*
                     WeatherCardView(name: viewModel.weather?.name, temperature: viewModel.temperature, highTemp: viewModel.highTemp, lowTemp: viewModel.lowTemp, weatherIcon: viewModel.weatherIcon, description: viewModel.description)
                    
                    Button(action: {
                        viewModel.query = self.query
                        
                        Task {
                            await viewModel.fetch2()
                        }
                    }, label: {
                        Text("Search")
                            .bold()
                            .font(.system(.largeTitle, design: .rounded))
                            .foregroundColor(.black)
                    })*/
                }
            }
            .sheet(isPresented: $showingSheet) {
                SheetView(showingSheet: $showingSheet, citiesList: $citiesList, viewModel: viewModel)
            }
            .onAppear {
                viewModel.cities = citiesList
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
