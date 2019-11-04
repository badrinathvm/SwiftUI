//
//  SegmentControl.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/3/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct SegmentControlView: View {
    @State private var dayNight = "day"
    @State private var tab = 1
    var body: some View {
        VStack {
            Text("Segment Control")
        
            Picker("", selection: $dayNight) {
                Text("Day").tag("day")
                Text("Night").tag("night")
            }
            .pickerStyle(SegmentedPickerStyle())
            .background(RoundedRectangle(cornerRadius: 8).stroke(Color.red, lineWidth: dayNight ==  "day" ? 1:0))
            .padding()
            
            Text("With Images")
            Picker("" , selection : $tab) {
                Image(systemName: "sun.min").tag(0)
                Image(systemName: "moon").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
        }
    }
}
