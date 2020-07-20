//
//  HollowDotsSpinner.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 7/19/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

struct HollowDotsSpinner: View {
    @State private var leftAnimates:Bool = false
    @State private var middleAnimates:Bool = false
    @State private var rightAnimates:Bool = false
    
    var body: some View {
        ZStack {
            //Left
            Circle()
                .stroke(lineWidth: 2)
                .frame(width: 12, height: 12)
                .offset(x: -20)
                .scaleEffect(self.leftAnimates ? 1: 0)
                .animation(Animation.spring().repeatForever(autoreverses: false).speed(0.5))
                .onAppear {
                    self.leftAnimates.toggle()
                }
            
            //Middle
            Circle()
                .stroke(lineWidth: 2)
                .frame(width: 12, height: 12)
                .scaleEffect(self.middleAnimates ? 1: 0)
                .animation(Animation.spring().repeatForever(autoreverses: false).speed(0.5).delay(0.15))
                .onAppear {
                    self.middleAnimates.toggle()
                }
            
            //Right
            Circle()
            .stroke(lineWidth: 2)
            .frame(width: 12, height: 12)
            .offset(x: 20)
            .scaleEffect(self.rightAnimates ? 1: 0)
            .animation(Animation.spring().repeatForever(autoreverses: false).speed(0.5).delay(0.25))
            .onAppear {
                self.rightAnimates.toggle()
            }
            
        }
    }
}

struct HollowDotsSpinner_Previews: PreviewProvider {
    static var previews: some View {
        HollowDotsSpinner()
    }
}
