//
//  SwiftUIView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 3/21/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

struct Shake: AnimatableModifier {
    var times: CGFloat = 0
    let amplitude: CGFloat = 10
    var animatableData: CGFloat {
        get { times }
        set { times = newValue }
    }
    func body(content: Content) -> some View {
        return content.offset(x: sin(times * .pi * 2) * amplitude)
    }
}

struct CustomAnimationView: View {
    @State private var taps: Int = 0
    @State private var fill: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Button("Empty Cart") {
                    withAnimation(.linear(duration: 0.5)) {
                        self.taps += 1
                        self.fill = true
                    }
                }.disabled(self.fill && self.taps > 0 )
                
                Spacer()
                
                Button("Fill Cart") {
                    withAnimation(.linear(duration: 0.5)) {
                        self.fill = true
                        self.taps = 0
                    }
                }.disabled(self.taps == 0)

            }.padding(.horizontal, 70)
            
            Image( self.fill && self.taps > 0 ? "cart_empty" : "cart_filled")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40 , height: 40)
                .shake(times: (self.taps > 0 ) ? self.taps * 3 : 0)
                .padding()
        }
    }
}
