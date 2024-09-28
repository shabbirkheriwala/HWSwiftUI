//
//  ContentView.swift
//  WeSplit
//
//  Created by Shabbir on 28/09/24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    @FocusState var amountIsFocused: Bool
    
    var tipPercentages = [0, 10, 15, 20, 25]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var totalAmount: Double {
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        
        return grandTotal
    }
    
    var localCurrency: FloatingPointFormatStyle<Double>.Currency {
        .currency(code: Locale.current.currency?.identifier ?? "INR")
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: localCurrency)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section {
                    if #available(iOS 16.0, *) {
                        Picker("Tip percentage", selection: $tipPercentage) {
                            ForEach(0..<101) {
                                Text("\($0) %")
                            }
                        }
                        .pickerStyle(.navigationLink)
                    } else {
                        Picker("Tip percentage", selection: $tipPercentage) {
                            ForEach(0..<101) {
                                Text("\($0) %")
                            }
                        }
                    }
                } header: {
                    Text("How much tip do you want to leave?")
                        .foregroundColor(Color(red: 0.20, green: 0.10, blue: 8.0))
                }
                
                Section {
                    Text(totalPerPerson, format: localCurrency)
                } header: {
                    Text("Amount per person")
                        .foregroundColor(Color(red: 0.20, green: 0.10, blue: 8.0))
                }
                
                Section {
                    Text(totalAmount, format: localCurrency)
                        .foregroundColor(tipPercentage == 0 ? .red : .black)
                    
                } header: {
                    Text("Total amount")
                        .font(
                            .title3
                            .bold()
                        )
                        .foregroundColor(.teal)
                        .bold()
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
