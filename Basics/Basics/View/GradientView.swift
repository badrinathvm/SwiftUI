//
//  GradientView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/9/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

//Tip : for better blending make ure to have same color for start and end of the Gradient's color array

struct GradientView: View  {
    var body: some View {
        let gradient = Gradient(colors: [.pink, .purple, .pink])
        let angularGradient = AngularGradient(gradient: gradient, center: .center, angle: .degrees(0))
        let nonCenteredAngularGradient = AngularGradient(gradient: gradient, center: .bottomTrailing, angle: .degrees(0))
        return VStack(spacing: 20) {
            Rectangle()
                .fill(angularGradient)
                .frame(height: 100)
            
            Rectangle()
            .fill(nonCenteredAngularGradient)
                .frame(height: 100)
            
            HStack {
                Circle().fill(angularGradient)
                Ellipse().fill(nonCenteredAngularGradient)
                Capsule().fill(angularGradient)
            }.padding(.horizontal)
            
            HStack {
                Circle().stroke(angularGradient, lineWidth: 5)
                Ellipse().stroke(angularGradient, lineWidth: 5)
                Capsule()
                    .trim(from: 0.25, to: 1)
                    .stroke(angularGradient, style: StrokeStyle(lineWidth: 5, lineCap: CGLineCap.round))
            }.padding(.horizontal)
            
            VStack(spacing : 10) {
                Button(action: {}) {
                    Text("Gradient on Background")
                        .padding()
                        .background(Capsule().fill(angularGradient))
                        .foregroundColor(.white)
                }
                
                Button(action : {}) {
                    Text("Gradient on Border")
                    .padding()
                        .background(Capsule().stroke(angularGradient))
                }
            }
        }
        
    }
}
