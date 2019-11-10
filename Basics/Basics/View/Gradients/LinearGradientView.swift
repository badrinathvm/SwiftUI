//
//  LinearGradientView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/9/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct LinearGradientView: View  {
    var body: some View  {
        
        let gradientColor = Gradient(colors: [.pink, .purple])
        let linearGradient = LinearGradient(gradient: gradientColor, startPoint: .top, endPoint: .bottom)
        let customLinearGradient = LinearGradient(gradient: gradientColor, startPoint: UnitPoint(x: 0, y: 0.25), endPoint: UnitPoint(x: 1, y: 0.75))
        
        let gradientColorStops = Gradient(stops: [ .init(color: Color.red, location: 0),
            .init(color: Color.orange, location : 0.75) , .init(color: Color.yellow, location: 1)])
        let linearGradientStops = LinearGradient(gradient: gradientColorStops, startPoint: .top, endPoint: .bottom)
        
//        return ZStack {
//            LinearGradient(gradient: gradientColor, startPoint: .top, endPoint: .bottom)
//                .edgesIgnoringSafeArea(.vertical)
//        }
        
        return VStack {
            Capsule().fill(linearGradient).frame(height: 100).padding(.horizontal)
            Button(action : {}) {
                Text("Linear Gradient button")
                    .padding()
                    .foregroundColor(.white)
            }.background(Capsule().fill(linearGradient))
            Circle().strokeBorder(linearGradient, lineWidth: 10).frame(height: 200)
            Rectangle().fill(customLinearGradient).frame(width:100, height: 100)
            
            HStack {
                VStack {
                    Text("0")
                    Spacer()
                    Text("0.75")
                        .padding(.bottom, 50)
                    Text("1")
                }
                Rectangle().fill(linearGradientStops)
            }.frame(height: 300)
                .padding()
        }
    }
}
