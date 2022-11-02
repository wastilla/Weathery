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
    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("Lightblue"), .blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
        }
    }
}
