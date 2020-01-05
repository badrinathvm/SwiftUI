//
//  MultipleAnimationView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 12/31/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct MultipleAnimationView: View {
    @State private var unlock = false
    @State private var open = false
    var body: some View  {
        VStack {
            Button(action: {
                self.unlock.toggle()
            }){
                Image(systemName: self.unlock ? "lock.open" : "lock")
                    .offset(x: self.unlock ? 4.5 : 0)
            }
            
            GeometryReader { geometry in
                ZStack {
                    VStack {
                        Text("Hello")
                        Image(systemName: "heart.fill")
                            .foregroundColor(Color.pink)
                    }.font(.system(size: 50))
                    
                    HStack(spacing: 0) {
                        Rectangle()
                            .fill(self.unlock ? Color.green : Color.red)
                            .offset(x: self.open ? -geometry.size.width / 2 : 0)
                        
                        Rectangle()
                        .fill(self.unlock ? Color.green : Color.red)
                        .offset(x: self.open ? geometry.size.width / 2 : 0)
                    }
                    
                    if self.unlock && self.open == false {
                        Button("O P E N") {
                            //these are called explicit animations.
                            withAnimation(Animation.easeOut(duration: 0.7)) {
                                self.open = true
                            }
                        }
                    }
                }
            }
        }
    }
}
