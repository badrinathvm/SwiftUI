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
    var body: some View {
        NavigationView {
            Form {
                Section {
                     TextField($checkAmount)
                        .textContentType(.oneTimeCode)
                }
               
                Section {
                    Text("$\(checkAmount)")
                }
                
                Section {
                    Picker(selection: $people, label: Text("Number of People")) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Tip View"))
        }
    }
}
