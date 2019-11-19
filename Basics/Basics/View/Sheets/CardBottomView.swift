//
//  CardBottomView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/18/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

let screen = UIScreen.main.bounds
let sheetHeight:CGFloat = 240

struct CardBottomView: View {
    @State private var show = false
    var body: some View {
        VStack{
            Button(action: {
                self.show.toggle()
            }) {
                HStack {
                    Text( !self.show ? "Show Bottom Sheet" : "Hide Bottom Sheet" )
                        .padding()
                        .foregroundColor(Color.white)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.blue))
                }
                
            }.padding(.top, 100)
            Spacer()
            BottomView(show: $show)
        }.edgesIgnoringSafeArea(.vertical)
    }
}

struct BottomView: View {
    @Binding var show:Bool
    @State private var viewHeight = CGSize.zero // required uring dragging.
    var body: some View {
        ZStack {
            VStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255))
                    .frame(height: 400)
                    .shadow(radius: 10, x:0 , y:2)
                    .animation(.spring())
                    .overlay(
                        VStack {
                            Rectangle()
                                .frame(width: 100, height: 6)
                                .foregroundColor(Color.gray)
                                .cornerRadius(20.0)
                                .padding()
                            Text("SwiftUI declartive programming eliminates the usage of View Controllers")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .font(.system(size: 15, weight: .regular))
                                .foregroundColor(Color.black)
                            Spacer()
                    })
            }.edgesIgnoringSafeArea(.vertical)
                .offset(y: !self.show ? screen.height - sheetHeight : 0)
                .offset(y:self.viewHeight.height)
                .onTapGesture {
                    self.show.toggle()
            }
            .gesture(
                DragGesture()
                .onChanged({ (value) in
                    self.viewHeight = value.translation
                })
                .onEnded({ (value) in
                    if value.translation.height > sheetHeight - 50 {
                        print("Value is \(value.translation.height)")
                        self.show.toggle()
                    }
                    self.viewHeight.height = .zero
                })
            )
        }
    }
}
