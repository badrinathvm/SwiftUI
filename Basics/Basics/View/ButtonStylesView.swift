//
//  ButtonStyles.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/11/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct ButtonStyleView: View {
    var body: some View {
        Group {
            Button("DefaultButtonStyle", action: {})
                .buttonStyle(DefaultButtonStyle())
                .padding()
            
            Button("PlainButtonStyle", action: {})
                .buttonStyle(PlainButtonStyle())
                .padding()
            
            Button("BorderlessButtonStyle", action: {})
                .buttonStyle(BorderlessButtonStyle())
                .padding()
            
            Button("Manually Modified", action:{})
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.blue, lineWidth: 2))
            
            Button("Using Button Style", action: {})
                .padding()
                .buttonStyle(OutlineButtonStyle(buttonColor: Color.blue))
            
            Button("Red Button Style", action: {})
                .padding()
                .buttonStyle(OutlineButtonStyle(buttonColor: Color.red))
            
            Button("Red Button Style", action: {})
                .padding()
                .buttonStyle(OutlineButtonStyle(buttonColor: Color.purple))
            
            Button("Button 1", action : {})
        }//.buttonStyle(OutlineButtonStyle())
    }
}

struct OutlineButtonStyle: ButtonStyle {
    var buttonColor = Color.blue
    func makeBody(configuration: Self.Configuration) -> some View {
        
        //Apply modifiers to configuration.label ( button body)
        configuration.label
             .opacity(configuration.isPressed ? 0.2 : 1) // Make the text flash when pressed
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).strokeBorder(buttonColor, lineWidth: 2))
            .foregroundColor(buttonColor)
            //.opacity(configuration.isPressed ? 0.2 : 1) // Make text AND border flash when pressed
    }
}
