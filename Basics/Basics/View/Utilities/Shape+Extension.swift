//
//  Shape+Extension.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 12/23/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
struct RoundedCorner: InsettableShape {
    var insetAmount: CGFloat = 0.0
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var roundedCorner: RoundedCorner = self
        roundedCorner.insetAmount += amount
        return roundedCorner
    }
}


