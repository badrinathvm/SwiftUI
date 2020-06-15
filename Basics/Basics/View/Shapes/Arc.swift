//
//  Arc.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 6/15/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

struct Arc: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
//        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle:.degrees(0), endAngle: .degrees(0), clockwise: true)
        
    // Shapes measure their coordinates from the bottom-left corner rather than the top-left corner,which means SwiftUI goes the other way around from one angle to the other.
    // so we habe to make rotation adjustment of .angle(90) to make it work.
        
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = .degrees(0) - rotationAdjustment
        let modifiedEnd = .degrees(180) - rotationAdjustment

        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: false)

        
        return path
    }
    

}

struct Arc_Previews: PreviewProvider {
    static var previews: some View {
        Arc()
        .frame(width: 300, height: 300)
            .foregroundColor(Color.blue)
    }
}
