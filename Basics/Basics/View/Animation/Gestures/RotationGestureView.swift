//
//  RotationGestureView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 1/5/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

//Note : Hold the option key to get gesture circles to rotate

struct RotationGestureView: View  {
    @State private var degrees = 0.0
    var body: some View {
        Group {
            Image(systemName: "gear")
                .font(.system(size: 300))
                .foregroundColor(Color.green)
                .rotationEffect(Angle.degrees(degrees))
                .gesture(RotationGesture().onChanged({ (angle) in
                    self.degrees = angle.degrees
                }))
                .animation(.default)
            
            Image(systemName: "gear")
                .font(.system(size: 140))
                .foregroundColor(Color.orange)
                .rotationEffect(-Angle.degrees(degrees))
                .gesture(RotationGesture().onChanged({ (angle) in
                    self.degrees = angle.degrees
                }))
                .offset(x: 130, y: 10)
        }
    }
}
