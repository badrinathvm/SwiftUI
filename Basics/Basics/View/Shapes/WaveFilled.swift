//
//  WaveFilled.swift
//  Basics
//
//  Created by Badrinath on 6/21/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

struct WaveFilled: View {
     @State private var change = false
    var body: some View {
        ZStack {
            Color.themeBackground
                .edgesIgnoringSafeArea(.all)
            VStack {
                ZStack(alignment: .top) {
                    WaveShape(yOffset: change ? 0.5 : -0.5)
                    .fill(Color.themeTertiary)
                    .opacity(0.5)
                    .frame(height: 150)
                    .shadow(radius: 4)
                    .animation(Animation.easeIn(duration: 2).repeatForever(autoreverses: true))
                    
                    WaveShape(yOffset: change ? 0.5 : -0.5)
                    .fill(Color.themeTertiary)
                    .frame(height: 100)
                    .shadow(radius: 4)
                        .animation(Animation.easeIn(duration: 2).repeatForever(autoreverses: true))
                }
                Spacer()
            }.edgesIgnoringSafeArea(.top)
        }
        .foregroundColor(Color.themeBackground)
        .onAppear {
            //withAnimation {
                self.change.toggle()
            //}
        }
    }
}

struct WaveFilled_Previews: PreviewProvider {
    static var previews: some View {
        WaveFilled()
            .preferredColorScheme(.light)
    }
}
