//
//  Arrow.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 6/15/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

struct Arrow: Shape {
    private let shoulderRatio:CGFloat = 0.65
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // device the height by 3
        let rowHeight = rect.height / 3
        let row1Y = rect.minY + rowHeight
        let shoulderX = rect.minX + rect.width * shoulderRatio
        let row2Y = row1Y + rowHeight
        
        //second row
        path.move(to: CGPoint(x: rect.minX, y: row1Y))
        path.addLine(to: CGPoint(x: shoulderX, y: row1Y))
        // lifting up to top
        path.addLine(to: CGPoint(x: shoulderX, y: rect.minY))
        // slant for to arrow
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        // slant for to down arrow
        path.addLine(to: CGPoint(x: shoulderX, y: rect.maxY))
        // pick up from down arrow to to
        path.addLine(to: CGPoint(x: shoulderX, y: row2Y))
        // horizontal line back to origin
        path.addLine(to: CGPoint(x: rect.minX, y: row2Y))
        path.closeSubpath()
        
        return path
    }
}

struct Arrow_Previews: PreviewProvider {
    static var previews: some View {
        Arrow()
            .frame(width: 400, height: 400)
    }
}
