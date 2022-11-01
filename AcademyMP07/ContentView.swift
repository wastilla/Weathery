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
        NavigationStack{
            VStack(alignment: .center){
                Text("Weathery")
                    .bold()
                    .font(.system(.largeTitle, design: .rounded))
                TextField("Enter a City", text: $query)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .backgroundStyle(.gray)
                NavigationLink<Text, WeatherView>{
                    WeatherView(query: $query)
                } label: {
                    Text("Search")
                        .bold()
                        .font(.system(.title, design: .rounded))
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
