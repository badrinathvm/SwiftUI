//
//  Wave.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 6/14/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

struct Wave: Shape {
    var bottomOffset:CGFloat = 30
    var topOffset:CGFloat = 100
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint.zero)
        
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: 0), control: CGPoint(x: rect.midX, y: topOffset))
        
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - bottomOffset ))
        
        path.addQuadCurve(to: CGPoint(x: 0, y: rect.maxY - bottomOffset), control: CGPoint(x: rect.midX, y: rect.maxY + 100))
        
        path.closeSubpath()
        
        return path
    }
    
   
}

struct Wave_Previews: PreviewProvider {
    static var previews: some View {
        Wave()
            .frame(height: 200)
            .border(Color.blue)
    }
}
