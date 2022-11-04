//
//  WeatherViewModel.swift
//  AcademyMP07
//
//  Created by will astilla on 10/26/22.
//

import Foundation

let apiKey = "755f77160a12ded1eddd9adc20b9c3f4"

class WeatherViewModel: ObservableObject {
    @Published var weathers: [Weather] = []
    
    @Published var weather: Weather?
    @Published var cities: [String] = []
    @Published var query: String = ""
    @Published var languages: [String] = []
    @Published var units: [String] = ["Metric", "Imperial", "Fahrenheit"]
   

    init() {
        self.weather = Weather.example
    }
    
    var temperature: String {
        guard let temp = weather?.main?.temp else {
            return "N/A"
        }
        
        return String(format: "%.0F F", temp.toFahrenheit())
    }
    
    var description: String {
        return weather?.weather?[0].weatherDescription ?? ""
    }
    
    var highTemp: String {
        guard let temp = weather?.main?.tempMax else {
            return "N/A"
        }
        
        return String(format: "%.0F F", temp.toFahrenheit())
    }
    
    var lowTemp: String {
        guard let temp = weather?.main?.tempMin else {
            return "N/A"
        }
        
        return String(format: "%.0F F", temp.toFahrenheit())
    }
    
    func getWeatherIcon(description: String) -> String {
        //let description: String? = weather?.weather?[0].weatherDescription ?? ""
        
        if description.range(of: "clear", options: .caseInsensitive) != nil {
            return "sun.max"
        }
        
        else if description.range(of: "overcast", options: .caseInsensitive) != nil {
            return "cloud.sun"
        }
        
        else if description.range(of: "thunderstorm", options: .caseInsensitive) != nil {
            return "cloud.bolt.rain"
        }
        
        else if description.range(of: "snow", options: .caseInsensitive) != nil {
            return "cloud.snow"
        }
        
        else if description.range(of: "heavy rain", options: .caseInsensitive) != nil {
            return "cloud.heavyrain"
        }
        else if description.range(of: "moderate rain", options: .caseInsensitive) != nil {
            return "cloud.drizzle"
        }
        else if description.range(of: "rain", options: .caseInsensitive) != nil {
            return "cloud.drizzle"
        }
        
        else if description.range(of: "cloud", options: .caseInsensitive) != nil {
            return "cloud"
        }
        
        else if description.range(of: "broken clouds", options: .caseInsensitive) != nil {
            return "cloud.sun"
        }
        
        return ""
    }
    
    func addCity(city: String){
        self.cities.append(city)
    }
    
    func fetch2(query: String) async {
        print("Starting Fetch2")
    
        let replaced = (query as NSString).replacingOccurrences(of: " ", with: "+")
     
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(replaced)&appid=\(apiKey)") else {
            print("Error")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedData = try? JSONDecoder().decode(Weather.self, from: data) {
                print(decodedData)
                weathers.append(decodedData)
            } else {
                print("Decoding error")
            }
        } catch {
            print("Error Loading Data")
        }
        print("finished")
    }
}
