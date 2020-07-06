//
//  CheckBoxView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/11/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct CheckBoxView: View {
    @State private var toggleState = true
    var body: some View {
        Group {
            Toggle("", isOn: $toggleState)
                .toggleStyle(CheckMarkToggleStyle(label: "Check on/off", color: Color.purple))
            
            Toggle("", isOn: $toggleState)
                .toggleStyle(CheckMarkToggleStyle(label: "My Check Mark", color: Color.green))
        }
    }
}

struct CheckMarkToggleStyle: ToggleStyle {
    var label = ""
    var color = Color.primary
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            Text(label)
            Spacer()
            Button(action: {
                configuration.isOn.toggle()
            }) {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square.fill")
                    .foregroundColor(color)
            }
        }.font(.title)
            .padding(.horizontal)
    }
}

struct CheckBoxView_Previews: PreviewProvider {
    static var previews: some View {
        CheckBoxView()
    }
}
