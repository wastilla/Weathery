//
//  ContentView.swift
//  AcademyMP07
//
//  Created by will astilla on 10/26/22.
//

import SwiftUI

struct ContentView: View {
    @State var query: String = ""
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
                    NavigationLink<Text, WeatherView> {
                        WeatherView(query: $query)
                        
                    } label: {
                        Text("Search")
                            .bold()
                            .font(.system(.title, design: .rounded))
                            .foregroundColor(.white)
                    }
                    .padding([.bottom], 250)
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
