//
//  SettingsView.swift
//  AcademyMP07
//
//  Created by will astilla on 11/9/22.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    @Binding var unit: String

    @State var units: [String] = ["Fahrenheit", "Celsius", "Kelvin"]

    var body: some View {
        VStack {
            Form {
                Section {
                    Picker(selection: $unit, label: Text("Units")) {
                        ForEach(units, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                }
            }
        }
    }
}
