//
//  DoubleExtensions.swift
//  AcademyMP07
//
//  Created by will astilla on 10/28/22.
//

import Foundation

extension Double {
    
    func toFahrenheit() -> Double {
        // current temperature is always in Kelvin
        let temperature = Measurement<UnitTemperature>(value: self, unit: .kelvin)
        // convert to fahrenheit from Kelvin
        let convertedTemperature = temperature.converted(to: .fahrenheit)
        return convertedTemperature.value
    }
}
