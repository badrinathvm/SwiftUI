//
//  AppearDisappearAnimationView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 1/4/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct AppearDisappearAnimationView: View  {
    @State private var showTip = true
    @State private var showInfoButton = false
    var body: some View  {
        VStack {
            Spacer()
            
//            Circle()
//                .fill(Color.green)
//                .frame(width: 100, height: 100)
//                .offset(x: 0, y: -20)
//            .overlay(Image(systemName: "line.horizontal.3")
//                .foregroundColor(Color.white)
//                .offset(x: 0, y: -50))
//
//            // this extends space entier screen
//            HStack {
//                Spacer()
//            }
//
//            Spacer()
            
            if showTip {
                VStack(spacing: 20) {
                    HStack {
                        Image(systemName: "info.circle.fill")
                        Spacer()
                        Text("Tip of the day")
                        Spacer()
                    }.foregroundColor(Color.white)

                    Spacer()

                    Button(action: {
                        self.showTip.toggle()
                    }) {
                        Text("Got It")
                    }
                }
                .padding()
                .background(Rectangle()
                        .fill(Color.green)
                        .shadow(radius: 3.0))
                .frame(height: 200)
                .padding(.horizontal)
                .onDisappear {
                    self.showInfoButton = true
                }
            }

            if self.showInfoButton {
                HStack {
                    Button(action: {
                        self.showTip = true
                        self.showInfoButton = false
                    }){
                        Image(systemName: "info.circle")
                    }.padding(.leading, 24)
                    Spacer()
                }
            }
        }.animation(.default)
            .font(.title)
    }
}
