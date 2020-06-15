//
//  CurvedRectangle.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 6/14/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

struct CurvedRectangle: Shape {
    
    var bottomOffset:CGFloat = 50.0
    
    var animatableData: CGFloat {
        get { bottomOffset }
        set { bottomOffset = newValue }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        //(0,0)
        path.move(to: CGPoint.zero)
        //(maxX, 0)
        path.addLine(to: CGPoint(x: rect.maxX, y: 0))
        //(maxX,maxY)
        path.addLine(to: CGPoint(x:rect.maxX, y: rect.maxY - bottomOffset))
        // (0, maxY)
        path.addQuadCurve(to: CGPoint(x: 0, y: rect.maxY - bottomOffset), control: CGPoint(x: rect.midX, y: rect.maxY
        + bottomOffset))
        
        path.closeSubpath()
        
        return path
    }
}

struct CurvedRectangle_Previews: PreviewProvider {
    static var previews: some View {
        CurvedRectangle()
            .frame(height: 200)
            .border(Color.blue)
    }
}
