//
//  MultipleAnimationsView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 12/31/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct MultipleAnimationsView: View  {
    @State private var change = false
    var body: some View  {
        VStack {
            
            Button(action: {
                self.change.toggle()
            }) {
                Text("Change")
            }
            
            Spacer()
            
            Image(systemName: "heart.fill")
                .foregroundColor(Color.yellow)
                .font(.system(size: 50))
               
                //first set of animation changes
                 .scaleEffect(change ? 2 : 1)
                .animation(Animation.easeInOut(duration: 1))
            
                // Second set of animation changes
                .scaleEffect(change ? 0.75 : 1)
                .animation(Animation.easeIn)
            
            Spacer()
            
            HStack {
                Color.blue
                    .hueRotation(Angle.degrees(change ? 180 : 0))
                Color.green
                    .hueRotation(Angle.degrees(change ? 180 : 0))
                Color.red
                    .hueRotation(Angle.degrees(change ? 180 : 0))
            }.animation(.linear)  //animation is applied to all entire HStack
            
            Spacer()
            
            HStack {
                Color.yellow
                VStack {
                    Color.yellow.frame(minHeight: 20)
                    Color.green.frame(width: change ? 200 : 100, height: change ? 200 : 100)
                    Color.yellow.frame(minHeight: 20)
                }
                Color.yellow
            }
            
            .animation(.default)
        }
    }
}
