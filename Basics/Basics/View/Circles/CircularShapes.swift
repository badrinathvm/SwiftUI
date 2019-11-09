//
//  CircularShapes.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/9/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct MoreCircleShapes: View {
    var body: some View  {
        VStack(spacing: 10) {
            Circle().fill(Color.purple).frame(height: 100).padding()
            
            //Text("Note : Fill Modifier apples specifically to shapes nopt a view.")
//                                 .frame(maxWidth: .infinity)
//                                 .padding()
//                                 .background(Color.purple)
//                                 .foregroundColor(Color.white)
//                                 .layoutPriority(2)
//
            //Circle().foregroundColor(Color.purple).frame(height: 100).padding()
            
            Circle().stroke(Color.purple).padding().foregroundColor(Color.black)
        }.font(.title)
       
    }
}

struct CircularShapes: View {
    var body: some View {
        ScrollView(Axis.Set.vertical) {
            VStack(spacing: 10){
                Text("There are three circular shapes available in SwiftUI")
                    .padding()
                    .frame(maxWidth : .infinity)
                    .foregroundColor(Color.white)
                    .background(Color.purple)
                    .layoutPriority(1)
                
                Text("Circle")
                Circle().padding()
                
                Text("Capsule")
                Capsule().frame(height: 60).padding()
                
                Text("Ellipse")
                Ellipse().frame(height: 60).padding()
                
                Text("Rounded Cornered Capsule")
                Capsule(style: RoundedCornerStyle.circular).frame(height: 60).padding()
                
                MoreCircleShapes()
            }.font(.title)
        }
    }
}
