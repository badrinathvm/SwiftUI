//
//  Triangle.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 6/15/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        //(midx , midy)
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        //Right corner line ( maxX, maxY)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        // bottom line (minX, maxY)
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
}

struct Triangle_Previews: PreviewProvider {
    static var previews: some View {
        Triangle()
            .frame(width: 300, height: 300)
    }
}
