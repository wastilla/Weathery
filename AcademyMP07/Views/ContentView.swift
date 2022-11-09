//
//  ContentView.swift
//  AcademyMP07
//
//  Created by will astilla on 10/26/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showingSheet = false
    @State var unit: String = "Fahrenheit"
   
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
                        
                        NavigationLink(destination: SettingsView(unit: $unit)){
                            Image(systemName: "gear")
                                .font(.system(.title))
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                    .padding([.leading, .trailing], 20)
                    Spacer()
                    Spacer()
                    ScrollView(.horizontal) {
                        HStack {
                            if viewModel.weathers.count != 0 {
                                ForEach(viewModel.weathers) { weather in
                                    VStack {
                                        WeatherCardView(viewModel: viewModel, unit: $unit, weather: weather)
                                    }
                                }
                            } else {
                                Text("Cick the \"+\" to enter a city! ")
                                    .font(.system(.title, design: .rounded))
                                    .foregroundColor(.white)
                                    .bold()
                            }
                        }
                    }
                    .padding([.leading], 20)
                    // .padding(.bottom, viewModel.cities.isEmpty ?  350 : 0)
                    Spacer()
                    Spacer()
                    Spacer()
                }
            }
            .sheet(isPresented: $showingSheet) {
                SheetView(showingSheet: $showingSheet, unit: $unit, viewModel: viewModel)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
