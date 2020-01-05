//
//  DragAnimationView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 1/4/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct DragAnimationView: View {
    @GestureState private var menuOffset = CGSize.zero
    @State private var currentMenuY:CGFloat = 0.0
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                Spacer()
                
                Circle()
                    .fill(Color.green)
                    .overlay(Image(systemName: "line.horizontal.3")
                            .foregroundColor(Color.white)
                        .offset(x: 0, y: -20))
                    .frame(width: 100, height: 100)
                    .offset(x: 0, y: -80)
                
                // this basically expands the view either side.
                HStack {
                    Spacer()
                }
                
                Spacer()
            }.font(.title)
            .frame(height: 200)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color.green))
        }.offset(x: 0, y: currentMenuY + menuOffset.height)
        .gesture(
            DragGesture().updating($menuOffset, body: { (value, menuOffset, transaction) in
                menuOffset = value.translation
            })
                .onEnded({ (value ) in
                    if value.translation.height > 100 {
                        self.currentMenuY = 200
                    }else {
                        self.currentMenuY = 0
                    }
                })
        )
            .animation(.easeIn)
    }
}
