//
//  BlendModeView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/10/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI


struct BlueRectangle:View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.blue)
            .frame(width: 100, height: 100)
            .shadow(radius: 5)
            .overlay(Text("Back Layer").foregroundColor(Color.white).font(.body))
    }
}

struct YellowRectangle:View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.yellow)
            .frame(width: 100, height: 100)
        .shadow(radius: 5)
    }
}

struct BlendModeView: View {
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing : 60) {
                ZStack {
                    BlueRectangle()
                    YellowRectangle().offset(x: 20, y: 20)
                        .blendMode(.colorBurn)
                }
                
                ZStack {
                    Image("y1")
                        .resizable().frame(width: 100, height: 100)
                    YellowRectangle()
                        .offset(x: 20, y: 20)
                        .blendMode(.colorBurn)
                }
            }
        }
    }
}
