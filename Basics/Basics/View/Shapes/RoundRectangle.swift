//
//  RoundRectangle.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 12/22/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

struct RoundRectangle: View {
    var body: some View {
    
        RoundRect()
            //.stroke(Color.blue,lineWidth: 2)
            .frame(width: 100, height: 100)
            .foregroundColor(.blue)
            
    }
}

struct RoundRect: Shape {
    var radius: CGFloat = 10.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // (0,0)
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        // line from (0,0) to (maxX, minY)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        
        // arc towards top right corner
        path.addArc(center: CGPoint(x: rect.maxX - radius, y: radius), radius: radius,
                    startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)

        // line from (maxX, minY) to (maxX, maxY)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))

        
        path.addLine(to: CGPoint(x: rect.maxX , y: rect.maxY))
        
        // line from bottom right corner to  bottom left
        path.addLine(to: CGPoint(x: rect.minX , y: rect.maxY))
        
        //arc towards top left corner
        path.addArc(center: CGPoint(x: radius, y: radius), radius: radius,
                    startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)

        return path
    }
}


struct RoundRectangle_Previews: PreviewProvider {
    static var previews: some View {
        RoundRectangle()
    }
}
