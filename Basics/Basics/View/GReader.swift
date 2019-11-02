//
//  GReader.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/2/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI


// Geometry Reader - to get size of the view , can access property like wodth , height , safe area insets

struct GReader: View {
    var body: some View {
        VStack(spacing: 5) {
            Text("Geometry Reader")
                .font(.largeTitle)
            
            GeometryReader { geometry in
                Text("Upper Right")
                    .position(x: geometry.size.width / 5, y: geometry.size.height / 10)
                Text("Lower Right")
                    .position(x: geometry.size.width - 90, y: geometry.size.height - 40)
            }
            .foregroundColor(Color.white)
            .background(Color.pink)
            
            GeometryReader { geometry in
                VStack(spacing: 10) {
                    Text("Width: \(geometry.size.width)")
                    Text("Height: \(geometry.size.height)")
                }
                .foregroundColor(Color.white)
                .background(Color.pink)
            }
            
            GeometryReader { geometry in
                VStack(spacing: 10) {
                    Text("Local Co-ordinates")
                    Text("X: \(geometry.frame(in: CoordinateSpace.local).origin.x)")
                    Text("Y: \(geometry.frame(in: CoordinateSpace.local).origin.y)")
                }.foregroundColor(Color.white)
            }
            .background(Color.pink)
            
            GeometryReader { geometry in
                VStack(spacing: 10) {
                    Text("Global Co-ordinates")
                    Text("X: \(geometry.frame(in: .global).origin.x)")
                    Text("Y: \(geometry.frame(in: .global).origin.y)")
                }
                .padding(10)
                .foregroundColor(Color.white)
                .frame(height: 200)
            }
            .background(Color.pink)
            
            GeometryReader { geometry in
                VStack {
                    Text("Safe Area Leading \(geometry.safeAreaInsets.leading)")
                    Text("Safe Area Trailing \(geometry.safeAreaInsets.trailing)")
                    Text("Safe Area Top \(geometry.safeAreaInsets.top)")
                    Text("Safe Area Bottom \(geometry.safeAreaInsets.bottom)")
                }
            }
            .foregroundColor(Color.white)
            .background(Color.pink)
            
            Text("Note: Position modifier uses view's center point when setting the X and Y parameters")
            
        }
        .font(.title)
        .padding(.horizontal)
    }
}
