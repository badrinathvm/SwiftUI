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

struct CartView: View {
    @State private var taps: Int = 0
    @State private var status: Bool = false
    
    var body: some View {
        VStack {
            Button(self.status ? "Fill Cart" : "Empty Cart") {
                withAnimation(.linear(duration: 0.5)) {
                    self.taps += 1
                    self.status.toggle()
                }
            }.animation(nil)
            .padding()
            .font(.system(size: 16, weight: Font.Weight.heavy))
            
            Image(self.status ? "cart_empty" : "cart_filled")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40 , height: 40)
                .shake(times: (self.taps > 0 ) ? self.taps * 3 : 0)
                .padding()
        }
    }
}
