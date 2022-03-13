//
//  ContentView.swift
//  ConverterApp
//
//  Created by Nguyen Dang Quy on 19/01/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var input = 100.0
    @State private var inputUnit = "Meters"
    @State private var outputUnit = "Kilometers"
    @FocusState private var inputIsFocused: Bool
    
    //Tao bo lua chon cho units
    let units = ["Feet", "Kilometers", "Meters", "Miles", "Yards"]
    
    var result: String {
        let inputToMeterMultiplier: Double
        let metersToOutputMultiplier: Double
        
        switch inputUnit {
        case "Feet":
            inputToMeterMultiplier = 0.3048
        case "Kilometers":
            inputToMeterMultiplier = 1000
        case "Miles":
            inputToMeterMultiplier = 1609.34
        case "Yards":
            inputToMeterMultiplier = 0.9144
        default:
            inputToMeterMultiplier = 1.0
        }
        
        switch outputUnit {
        case "Feet":
            metersToOutputMultiplier = 3.28084
        case "Kilometers":
            metersToOutputMultiplier = 0.001
        case "Miles":
            metersToOutputMultiplier = 0.000621371
        case "Yards":
            metersToOutputMultiplier = 1.09361
        default:
            metersToOutputMultiplier = 1.0
        }
        
        let inputInMeters = input * inputToMeterMultiplier
        let output = inputInMeters * metersToOutputMultiplier
        
        let outputString = output.formatted()
        return "\(outputString) \(outputUnit.lowercased())"
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $input, format: .number)
                        /*
                         .numberPad hoac .decimalPad ban phim nhap so tu 0-9
                         Nhung .decimalPad nhap duoc so thap phan
                         */
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                } header: {
                    Text("Amount to convert")
                }
                
                //Picker lua chon va doc gia tri tu units
                Picker("Convert from", selection: $inputUnit) {
                    ForEach(units, id: \.self) {
                        Text($0)
                    }
                }
                
                Picker("Convert to", selection: $outputUnit) {
                    ForEach(units, id: \.self) {
                        Text($0)
                    }
                }
                
                Section {
                    Text(result)
                } header: {
                    Text("Result")
                }
            }
            .navigationTitle("Converter")
            
            //dat cac nut vao thanh cong cu o cuoi man hinh
            .toolbar {
                //Tao nhieu nut vao keyboard
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        inputIsFocused = false
                    }
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
