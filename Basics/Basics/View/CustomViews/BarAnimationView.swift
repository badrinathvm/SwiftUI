//
//  BarAnimationView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/12/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct BarView: View {
    var height:CGFloat
    var day: String
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Capsule().frame(width: 20, height: 200).padding().foregroundColor(Color(red: 222/255, green: 222/255, blue: 222/255))
                Capsule().frame(width: 20, height: height, alignment: .bottom).padding().foregroundColor(Color.white)
            }
            Text(day).foregroundColor(Color.white)
        }
    }
}

struct BarAnimationView: View {
    @State private var pickerSelected = 0
    @State var dataPoints : [[CGFloat]] = [[50, 100, 150],[150,100,30],[5,10,20]]
    var body: some View {
        ZStack {
            Color.blue
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 10) {
                Picker("", selection: $pickerSelected) {
                    Text("WeekDay").tag(0)
                    Text("Evening").tag(1)
                    Text("Afternoon").tag(2)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding()
                
                HStack {
                    BarView(height: dataPoints[pickerSelected][0], day: "Su")
                    BarView(height: dataPoints[pickerSelected][1], day: "M")
                    BarView(height: dataPoints[pickerSelected][2], day: "Tu")
                    BarView(height: dataPoints[pickerSelected][0], day: "We")
                    BarView(height: dataPoints[pickerSelected][1], day: "Th")
                    BarView(height: dataPoints[pickerSelected][2], day: "Fr")
                    BarView(height: dataPoints[pickerSelected][0], day: "Sa")
                }.animation(.easeOut)
            }
        }
    }
}

struct BarAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        BarView(height: 100, day: "Su")
        BarView(height: 100, day: "M")
    }
}
