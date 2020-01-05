//
//  FlipAnimationView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 12/31/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct FlipAnimationView: View {
    @State private var flipHorizontal = false
    @State private var flipVertical = false
    var body: some View  {
        VStack {
            HStack(spacing : 50 ) {
                Button(action: {
                    //( Animation.default )
                    withAnimation {
                        self.flipHorizontal.toggle()
                    }
                }) {
                    Image(systemName: "flip.horizontal.fill")
                        .font(.system(size: 50))
                        .padding()
                }
                
                Button(action: {
                    withAnimation {
                        self.flipVertical.toggle()
                    }
                }) {
                    Image(systemName: "flip.horizontal.fill")
                        .font(.system(size: 50))
                        .padding()
                        .rotationEffect(Angle.degrees(90))
                }
            }
           
            Image("y1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(30)
                .padding()
                .scaleEffect(x: flipHorizontal ? -1 : 1, y: flipVertical ? -1 : 1)
        }
    }
}
