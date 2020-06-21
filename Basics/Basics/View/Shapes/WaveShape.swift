//
//  WaveShape.swift
//  Basics
//
//  Created by Badrinath on 6/21/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

struct WaveShape: Shape {
    var yOffset:CGFloat = 0.5
    
    var animatableData: CGFloat {
        get {
            return yOffset
        }
        set {
            yOffset = newValue
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        //(0,0)
        path.move(to: CGPoint.zero)
        //(maxX, minY)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        //(maXX, maxY)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        //(minX, maxY)
        path.addCurve(to: CGPoint(x: rect.minX, y: rect.maxY),
                      control1: CGPoint(x: rect.maxX * 0.75, y: rect.maxY - (rect.maxY * yOffset)),
                      control2: CGPoint(x: rect.maxX * 0.25, y: rect.maxY + (rect.maxY * yOffset)))
        path.closeSubpath()
        
        
        return path
    }
    
    
}

struct WaveShape_Previews: PreviewProvider {
    static var previews: some View {
        WaveShape()
            .stroke(Color.red, lineWidth: 2)
            .frame(height: 200)
            .padding()
    }
}
