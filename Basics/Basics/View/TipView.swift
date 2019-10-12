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
            }
            .navigationBarTitle(Text("Tip View"))
        }
    }
}
