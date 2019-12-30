//
//  SequenceAnimation.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 12/30/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct SequenceAnimationView: View {
    @State private var show = false
    var body: some View {
        VStack(spacing: 60) {
            Text("Sequence Animation")
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.red)
                .foregroundColor(Color.white)
            
            Group {
                Image(systemName: "1.circle")
                    .opacity(show ? 1: 0)
                    .animation(Animation.easeInOut.delay(0.7))
                Image(systemName: "2.circle")
                     .opacity(show ? 1: 0)
                     .animation(Animation.easeInOut.delay(0.9))
                Image(systemName: "3.circle")
                     .opacity(show ? 1: 0)
                    .animation(Animation.easeInOut.delay(1.3))
                
                Button(action: {
                    
                }) {
                    Text("GO!")
                        .padding()
                        .foregroundColor(Color.white)
                        .font(.system(size: 50))
                        .background(Circle().foregroundColor(Color.green))
                         .opacity(show ? 1: 0)
                        .animation(Animation.easeInOut.delay(2.0))
                }
            }.font(Font.system(size: 100))
        }.onAppear { self.show = true }
    }
}
