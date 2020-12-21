//
//  Alignment+Extension.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 12/20/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

//Notes : lastTextBaseline aligns the images to the bottom.

extension VerticalAlignment {
    private enum MidAlignemnt: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context[.bottom]
        }
    }
    
    static let midAlignment = VerticalAlignment(MidAlignemnt.self)
    
    private enum Topalignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context[.top]
        }
    }
    
    static let topAlignment = VerticalAlignment(Topalignment.self)
}
