//
//  CircleTrim.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/9/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct CircleTrim: View {
    @State private var circleProgress: CGFloat = 1.0
    var circlePercentage:Int {
        Int(circleProgress * 100.0)
    }
    
    var body: some View {
        VStack(spacing : 40) {
            Circle()
                .trim(from: 0, to:circleProgress )
                .stroke(Color.purple, style: StrokeStyle(lineWidth: 40, lineCap: CGLineCap.round))
                .frame(height: 300)
               .rotationEffect(.degrees(-90)) //refer circle diagram to indicate why -90//
                .overlay(Text("\(circlePercentage)%")
                    .font(.largeTitle)
                    .padding(40))
            
            VStack {
                Text("Progress")
                HStack {
                    Text("0%")
                    Slider(value: $circleProgress)
                    Text("100%")
                }.padding()
            }
            
            VStack(spacing: 20) {
                Button(action: {}) {
                    Text("Use Capsule Border")
                        .font(.title)
                    .padding()
                }.background(Capsule().strokeBorder(Color.purple, lineWidth: 2.0))
                 .accentColor(Color.purple)
                
                Button(action : {}) {
                    Text("Use Capsule Shape")
                        .font(.largeTitle)
                    .padding()
                }.background(Capsule().foregroundColor(Color.purple))
                    .accentColor(Color.white)
                    
                
                Button(action : {}) {
                    Image(systemName: "circle.grid.hex.fill")
                        .font(.largeTitle)
                    .padding()
                }
                .background(Circle().foregroundColor(Color.purple))
                .accentColor(.white)
            }
        }
    }
}
