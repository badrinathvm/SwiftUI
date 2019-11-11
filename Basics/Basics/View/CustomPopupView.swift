//
//  CustomPopup.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/10/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct CustomPopupView: View {
    @State private var showModal = false
    var body: some View {
        let gradient = Gradient(colors: [Color.orange, Color.yellow, Color.orange])
        let linearGradient = LinearGradient(gradient: gradient, startPoint: .center, endPoint: .bottom)
        return ZStack {
            VStack {
                Text("This is a screen undearneath the popoup")
                .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .foregroundColor(Color.white)
                Spacer()
                Button(action: {
                    self.showModal = true
                }) {
                    Text("Show Popup")
                        .padding()
                        .background(Capsule().stroke(linearGradient, lineWidth: 2))
                        .foregroundColor(Color.orange)
                }
                Spacer()
            }.padding(.top, 40)
                .blur(radius: $showModal.wrappedValue ? 3 : 0)
            
            
            if $showModal.wrappedValue {
                ZStack {
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                    VStack(spacing: 20) {
                        Text("Popoup")
                        .padding()
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color.white)
                            .background(Color.orange)
                        Spacer()
                        Button(action: {
                            self.showModal = false
                        }) {
                            Text("Close")
                        }.padding()
                    }.frame(width: 300, height: 200)
                    .background(Color.white)
                    .cornerRadius(20).shadow(radius: 5)
                }
            }
        }
    }
}
