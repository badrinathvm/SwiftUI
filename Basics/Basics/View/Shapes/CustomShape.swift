//
//  CustomShape.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 12/1/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

struct ToolTipView : View {
    var body: some View {

        Text("$400")
            .foregroundColor(.black)
            .font(Font.system(size: 32, weight: Font.Weight.bold))
            .padding(.horizontal,40)
            .padding(.vertical, 20)
            .background(RoundedCorners(radius: 20).fill(Color.white)
                            .shadow(color: Color(UIColor.lightGray), radius: 8, x: 0, y: 0))
           
    }
}

struct RoundedCorners: Shape {
    var radius: CGFloat = 0.0
    
    var offset:CGFloat = 20

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let width = rect.maxX
        let height = rect.maxY

        // (0,0)
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        // line from (0,0) to (maxX, minY)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        // arc towards top right corner
        path.addArc(center: CGPoint(x: width - radius, y: radius), radius: radius,
                    startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)

        // line from (maxX, minY) to (maxX, maxY)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        //arc towards bottom right corner
        path.addArc(center: CGPoint(x: width - radius, y: height - radius), radius: radius,
                    startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
        
        // line from bottom right corner to midX + 10
        path.addLine(to: CGPoint(x: rect.midX + 10 , y: rect.maxY))

        //bottom triangle slant
        path.addLine(to: CGPoint(x: rect.midX - offset / 2, y: rect.maxY + offset))

        //top triangle slant
        path.addLine(to: CGPoint(x: rect.midX - 25, y: rect.maxY))

        //arc towards bottom left corner
        path.addArc(center: CGPoint(x: radius, y: height - radius), radius: radius,
                    startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)

        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        //arc towards top left corner
        path.addArc(center: CGPoint(x: radius, y: radius), radius: radius,
                    startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)

        return path
    }
}

struct CustomShape_Previews: PreviewProvider {
    static var previews: some View {
        ToolTipView()
    }
}
