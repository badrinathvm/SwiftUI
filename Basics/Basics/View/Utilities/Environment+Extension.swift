//
//  Environment+Extension.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 12/24/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI


/// Environment Key for Auto Spacing
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
struct OverlayKey: EnvironmentKey {
    /// provide a default value for custom dependency
    static var defaultValue:Bool = false
}

extension EnvironmentValues {
    /// property wrapper  for `OverlayKey`
    var showOverlay: Bool {
        get { self[OverlayKey.self] }
        set { self[OverlayKey.self] = newValue }
    }
}


