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
    @Binding var unit: String
    
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section {
                        TextField("Enter a City Name", text: $newCity)
                            .foregroundColor(.blue)
                            .font(.title2)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .trailing], 40)
                            
                            .onSubmit {
                                if !viewModel.cities.contains(newCity) {
                                    showingSheet = false
                                    viewModel.cities.append(newCity)
                                    Task {
                                        await viewModel.fetch2(query: newCity)
                                    }
                                }
                            }
                            
                    } header: {
                        Text("Add a City")
                    }
                   
                }
            }
            .toolbar {
                ToolbarItemGroup {
                    Button("Close") {
                        self.showingSheet.toggle()
                    }
                }
            }
        }
    }
}
