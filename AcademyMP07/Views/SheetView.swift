//
//  SheetView.swift
//  AcademyMP07
//
//  Created by will astilla on 11/2/22.
//

import Foundation
import SwiftUI

struct SheetView: View {
    @State var newCity: String = ""
    
    
    @Binding var showingSheet: Bool
    @Binding var citiesList: [String]
    
    @ObservedObject var viewModel: WeatherViewModel
    
    
    
    var body: some View {
        VStack{
            Button("Close"){
                self.showingSheet.toggle()
            }
            Text("This is the sheet!")
            
            TextField("Enter a City", text: $newCity)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding([.leading, .trailing], 40)
                .onSubmit {
                    showingSheet = false
                    viewModel.cities.append(newCity)
                }
            
        }
    }
}
