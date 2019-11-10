//
//  RadialGradientView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/9/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct RadialGradientView: View {
   
    var body: some View {
        let gradient = Gradient(colors:[.yellow, .orange, .white] )
        let radialGradient = RadialGradient(gradient: gradient, center: .bottom, startRadius: 100, endRadius: 700)
        let smallRadial = RadialGradient(gradient: gradient, center: .center, startRadius: 1, endRadius: 150)
        return ZStack {
            RoundedRectangle(cornerRadius: 20)
            .fill(radialGradient)
                .edgesIgnoringSafeArea(.vertical)
            
            VStack(spacing : 20) {
                Text("Radial Gradient").font(.largeTitle)
                Text("Introduction").font(.title).foregroundColor(.gray)
                Text("Radius mesaures the distance from the center of the circle outward.You can set a startRadius to determine how far the first color should expand outward.The endRadius defines the end of the gradient spread.if the endRadius is greater than startRadius, the last color defined in the Gradient object will fill everything beyind that endRadius").padding()
                
                Group {
                    Circle().fill(smallRadial)
                    RoundedRectangle(cornerRadius: 20)
                    .fill(smallRadial)
                    .padding(30)
                    Circle().strokeBorder(smallRadial, lineWidth: 40)
                }.shadow(color: Color.white , radius: 10)
            }
        }
    }
}
