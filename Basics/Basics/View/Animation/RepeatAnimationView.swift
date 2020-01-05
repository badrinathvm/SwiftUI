//
//  RepeatAnimationView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 12/30/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct RepeatAnimationView:View {
    @State private var start = false
    var body: some View {
        VStack {
            Button("Start", action: {
                self.start.toggle()
            })
                .padding()
                .background(Color.green)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.green,lineWidth: 2)
                    .scaleEffect(start ? 2: 1)
                    .opacity(start ? 0: 1))
                //.animation(Animation.easeOut(duration: 0.6).repeatCount(3, autoreverses: false)) // when we use repeatcount anumation will be automatically reversed
            
               .animation(Animation.easeOut(duration: 0.6)
                .delay(1)
                .repeatForever(autoreverses: false))
            
            //Note : Until and unless u set autoreverse to false ( reverse animation is done by system by default )
        }
    }
}
