//
//  TipView.swift
//  Basics
//
//  Created by Badarinath Venkatnarayansetty on 10/12/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct TipView:View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 0
    
    var tipPercentages = [10,15,20,25,0]
    var totalPerPerson:Double {
        let peopleCount = Double(numberOfPeople)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                     TextField($checkAmount)
                    
                    Picker(selection: $numberOfPeople, label: Text("Number of People")) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header: Text("How much Tip you want to pay ?"), footer: Text("")) {
                    Picker(selection: $tipPercentage, label: Text("Tip Percentage")) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                }
                
                Section(header: Text("Amount per person"), footer: Text(""), content: {
                     Text("$\(totalPerPerson)")
                })
            }
            .navigationBarTitle(Text("Tip View"))
        }
    }
}
