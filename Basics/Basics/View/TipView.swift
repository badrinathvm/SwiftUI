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
    @State private var people = 0
    @State private var tipPercentage = 0
    
    var tipPercentages = [0,10,20,30,40,50]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                     TextField($checkAmount)
                    
                    Picker(selection: $people, label: Text("Number of People")) {
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
                
                Section {
                    Text("$\(checkAmount)")
                }
            }
            .navigationBarTitle(Text("Tip View"))
        }
    }
}
