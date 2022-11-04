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
    
    @ObservedObject var viewModel: WeatherViewModel
    
    
    
    var body: some View {
        VStack{
            Button("Close"){
                self.showingSheet.toggle()
            }
            
            TextField("Enter a City", text: $newCity)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding([.leading, .trailing], 40)
                .onSubmit {
                    if !viewModel.cities.contains(newCity){
                        showingSheet = false
                        viewModel.cities.append(newCity)
                        Task {
                            await viewModel.fetch2(query: newCity)
                        }
                    }
                    
                }
            
        }
    }
}
