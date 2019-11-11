//
//  ToggleReConstructionView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/11/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct ToggleReConstructionView : View {
    @State private var toggleState = false
    @State private var toggleState1 = false
    var body: some View {
        Group {
            Toggle("", isOn: $toggleState)
                .toggleStyle(ColoredToggleStyle(label: "My Colored  Toggle", onColor: .purple, offColor: .red, thumbColor: .white))
                .padding()
            
            Toggle("", isOn: $toggleState)
                .toggleStyle(ColoredToggleStyle(label: "Second Colored Toggle", onColor: .purple))
            .padding()
        }
    }
}

struct ColoredToggleStyle: ToggleStyle {
    var label = ""
    var onColor = Color.green
    var offColor = Color(UIColor.systemGray5)
    var thumbColor = Color.white
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            Text(label)
            Spacer()
            Button(action: {
                configuration.isOn.toggle()
            } ) {
                RoundedRectangle(cornerRadius: CGFloat(16.0), style: .circular)
                    .fill(configuration.isOn ? onColor : offColor)
                    .frame(width: 50, height: 29)
                    .overlay(Circle()
                        .fill(thumbColor)
                        .shadow(radius: 1, x:0 , y:1)
                        .padding(1.5) // padding all sidesof the thumb.
                        .offset(x: configuration.isOn ? 10: -10)) // thumn shifting between left and right.
                    .animation(Animation.easeInOut(duration: 0.1))
            }
        }
    }
}
