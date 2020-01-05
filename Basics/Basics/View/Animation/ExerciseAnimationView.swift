//
//  ExerciseAnimationView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 1/5/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct TopView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Triggers")
                .font(.title)
            Text("Show Popoup")
                .padding()
                .foregroundColor(Color.gray)
                .font(.system(size: 20))
            
            Text("The Popup will animate when shown and animate will disappers.")
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.yellow)
                .foregroundColor(Color.black)
                .font(.body)
        }
    }
}

struct PopupView: View  {
    @Binding var showPopup : Bool
    @GestureState var popOffset : CGSize
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.3)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    self.showPopup = false
            }
            
            VStack(spacing: 20) {
                Text("Drag popoff the screen")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.yellow)
                Spacer()
                Text("You can also tap outside the popup to close")
                Spacer()
                Button(action: {
                    self.showPopup = false
                }){
                    Text("or Tap this Buttont to close")
                }.padding(.bottom)
            }
            .frame(height: 300)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 20)
            .padding(.horizontal, 25)
            .offset(self.popOffset)
            .gesture(
                DragGesture(minimumDistance: 100)
                    .updating($popOffset, body: { (value, popupOffset, transaction) in
                        popupOffset = value.translation
                    })
                    .onEnded({ (value) in
                        self.showPopup = false
                    })
            )
                .animation(.default)
        }
    }
}

struct ExerciseAnimationView: View  {
    @State private var showPopup = false
    @GestureState private var popOffset = CGSize.zero
    var body: some View  {
        ZStack {
            VStack {
                TopView()
                
                Spacer()
                
                Button(action: {
                    self.showPopup.toggle()
                }) {
                    Text("Show Popup")
                        .font(.title)
                }
            }.blur(radius: showPopup ? 2: 0).animation(.easeIn) // blur the content present inside vertical stack
            
            if showPopup {
                PopupView(showPopup: self.$showPopup, popOffset: self.popOffset)
            }
        }
    }
}
