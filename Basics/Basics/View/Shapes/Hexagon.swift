//
//  Hexagon.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 6/15/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

struct Hexagon: Shape {
    var width : CGFloat = 300
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        //starting point : (30, minY)
        path.move(to: CGPoint(x: 30, y: rect.minY))
        
        // adding line to (width - some offset, minY)
        path.addLine(to: CGPoint(x: width - 50, y: rect.minY))
        
        //adding line to (maxX, half of the maxY)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY / 2))
        
        //adding line to (width - some offset, maxY)
        path.addLine(to: CGPoint(x: width - 50, y: rect.maxY))
        
        //adding bottom line to (30, maxY)
        path.addLine(to: CGPoint(x: 30, y: rect.maxY))
        
        //adding line to (-20, half of the maxY )
        path.addLine(to: CGPoint(x: -10, y: rect.maxY / 2))
        
        //close the path
        path.closeSubpath()
        
        return path
    }
    
}

struct Hexagon_Previews: PreviewProvider {
    static var previews: some View {
        Hexagon()
        .frame(width: 300, height: 300)
    }
}
