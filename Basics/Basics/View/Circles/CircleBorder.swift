//
//  CircleBorder.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/9/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct CircleBorder: View  {
    var body: some View  {
        VStack {
            Circle().stroke(Color.purple).frame(height: 60).padding()
            Capsule().stroke(Color.purple, lineWidth: 20).frame(height: 60).padding()
            /*dash paramter
               15 - length of the dash
               2 - length between the dashes.( small white gap)
            */
            Ellipse().stroke(Color.purple, style: StrokeStyle(lineWidth: 10 , dash: [15,2])).frame(height: 60).padding()
            
            ZStack {
                Circle().fill(Color.red).padding()
                Circle().fill(Color.white).padding(40)
                Circle().fill(Color.red).padding(60)
            }.frame(width: 200 , height: 200)
            
            ZStack(alignment: .top) {
                Circle().fill(Color.secondary).frame(height: 250)
                Circle().fill(Color.secondary).frame(height: 200)
                Circle().fill(Color.secondary).frame(height: 150)
                Circle().fill(Color.secondary).frame(height: 100)
            }
        }
    }
}
