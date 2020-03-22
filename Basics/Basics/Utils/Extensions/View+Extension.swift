//
//  View+Extension.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 3/21/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

extension View {
    
    /// Prints the description of any SwiftUI View.
    func debug() -> Self {
        print(Mirror(reflecting: self).subjectType)
        return self
    }
    
    /// Returns default margins set by `marginSize` environment varaible.
    /// - Parameter margins: default value for margins
    func hoarizontalMargins(_ margins: CGFloat) -> some View {
        self.environment(\.marginSize, margins)
            .padding(.horizontal, margins)
    }
    
    func shake(times: Int) -> some View {
         return modifier(Shake(times: CGFloat(times)))
     }
}

//MARK:- Creating a Custom Environment Keys this allows to easily pass value to any view by using environment modifier.
extension EnvironmentValues {
    var marginSize: CGFloat {
        get { self[MarginSizeKey.self] }
        set { self[MarginSizeKey.self] = newValue }
    }
}

struct MarginSizeKey: EnvironmentKey {
    static let defaultValue: CGFloat = 16.0
}
