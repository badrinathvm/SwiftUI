//
//  StepperAnimationView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 1/4/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct StepperAnimationView: View {
    @State private var stepperValue:CGFloat = 1.0
    @State private var expand:Bool = false
    var body: some View {
        VStack(spacing: 20) {
            ZStack {
                ForEach(0...40, id: \.self) { _ in
                    Circle().foregroundColor(Color.green).opacity(0.2)
                        .position(x: .random(in: self.stepperValue...300),
                                  y: .random(in: self.stepperValue...300))
                        .frame(width: .random(in: 10...100),
                               height: .random(in: 10...100))
                        .animation(.default)
                }
            }
            
//            ZStack {
//                Image(systemName: "sun.max.fill")
//                .padding()
//                .foregroundColor(Color.red)
//                .background(Circle()
//                    .fill(Color.green)
//                    .scaleEffect(expand ? 20 : 1)
//                    .edgesIgnoringSafeArea(.all))
//                .onAppear { self.expand.toggle() }
//                .animation(.easeIn)
//            }
            
            Spacer()
            
            Stepper("Adjust", value: $stepperValue, in: 1...5).padding()
        }
    }
}
