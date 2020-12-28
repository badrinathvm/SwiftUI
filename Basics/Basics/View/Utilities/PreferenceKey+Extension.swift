//
//  PreferenceKey+Extension.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 12/26/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI


// ---- PreferenceKey struts for calculatin the height and anchor data.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
struct VerticalHeightPreference: PreferenceKey {
    typealias Value = [Int:CGFloat]
    /// provide a default value for custom dependency
    static let defaultValue: Value = [:]
    
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value.merge(nextValue(), uniquingKeysWith: max)
    }
}


struct AnchorPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat?

    static func reduce(value: inout CGFloat?, nextValue: () -> CGFloat?) {
        value = value ?? nextValue()
    }
}
