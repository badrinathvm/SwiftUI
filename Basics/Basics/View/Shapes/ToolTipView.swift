//
//  CustomShape.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 12/1/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

struct ToolTipView1 : View {
    var body: some View {

        Text("$400")
            .foregroundColor(.black)
            .font(Font.system(size: 32, weight: Font.Weight.bold))
            .frame(width: 150, height: 100)
            .background(ToolTip(cornerRadius: 8, bottomOffset: 10).fill(Color.white)
                            .shadow(color: Color(UIColor.lightGray), radius: 8, x: 0, y: 0))
           
    }
}


import SwiftUI

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct ToolTip: Shape {
    var cornerRadius: CGFloat = 0.0
    var bottomOffset: CGFloat = 0.0
    
    public init(cornerRadius: CGFloat, bottomOffset: CGFloat) {
        self.cornerRadius = cornerRadius
        self.bottomOffset = bottomOffset
    }
    
    public func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // (0,0)
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        
        // line from top left corner to top right corner
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        
        // arc towards top right corner
        path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: cornerRadius), radius: cornerRadius,
                    startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
        
        // line from top right corner to bottom right corner
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        
        //arc towards bottom right corner
        path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius), radius: cornerRadius,
                    startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
        
        // line from bottom right corner to midX + 10
        path.addLine(to: CGPoint(x: rect.midX + 10 , y: rect.maxY))
        
        let arrowOffset = bottomOffset
        
        //bottom triangle slant
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY + arrowOffset))
        
        //top triangle slant
        path.addLine(to: CGPoint(x: rect.midX - 10, y: rect.maxY))
        
        //arc towards bottom left corner
        path.addArc(center: CGPoint(x: cornerRadius, y: rect.maxY - cornerRadius), radius: cornerRadius,
                    startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
        
        //line from bottom left corner to top left corner
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        
        //arc towards top left corner
        path.addArc(center: CGPoint(x: cornerRadius, y: cornerRadius), radius: cornerRadius,
                    startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
        
        return path
    }
}

struct ToolTipView_Previews: PreviewProvider {
    static var previews: some View {
        ToolTipView1()
    }
}
