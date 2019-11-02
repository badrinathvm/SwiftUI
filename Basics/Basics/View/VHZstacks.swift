//
//  Hstacks.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/2/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

//Key Points : ZStack is about adding layers one above the other

struct ForeGroundPadding: ViewModifier {
    func body(content: Content) -> some View {
        content.foregroundColor(Color.white)
        .padding()
    }
}

struct VHZstacks: View {
    var body: some View {
        ZStack {
            //Layer 1: Furthest back
            Color.black //adds black color for the background
                .edgesIgnoringSafeArea(.all) // ignore safe area
            
            //Layer 2: This Vstackis on Top
            VStack {
                //Adding an extra spacer at the top.
                VStack {
                    Rectangle().frame(width: 390 , height: 45).foregroundColor(Color.black)
                }
                
                HStack {
                    Text("Leading")
                    Text("Middle")
                    Text("Trailing")
                }.modifier(ForeGroundPadding())
                    .border(Color.orange)
                
                HStack(spacing: 10) {
                    Image(systemName: "1.circle")
                    Image(systemName: "2.circle")
                    Image(systemName: "3.circle")
                }.modifier(ForeGroundPadding())
                
                HStack {
                    HStack(spacing: 20) {
                        Image(systemName: "a.circle.fill")
                        Image(systemName: "b.circle.fill")
                        Image(systemName: "c.circle.fill")
                        Image(systemName: "d.circle.fill")
                        Image(systemName: "e.circle.fill")
                    }.foregroundColor(Color.white)
                }
                .font(.largeTitle).padding()
                .background(RoundedRectangle(cornerRadius: 10))
                .foregroundColor(Color.orange)
                //by default alignment is 'Center'
                HStack {
                    Rectangle().frame(width: 25, height: 100).foregroundColor(Color.orange)
                    Text("Leading").foregroundColor(Color.white)
                    Spacer()
                    Text("Center").foregroundColor(Color.white)
                    Spacer()
                    Text("Trailing").foregroundColor(Color.white).padding(.trailing)
                }.border(Color.orange)
                
                HStack(alignment: .top) {
                    Rectangle().frame(width: 25,height: 100).foregroundColor(Color.orange)
                    Text("Leading").foregroundColor(Color.white)
                    Spacer()
                    Text("Center").foregroundColor(Color.white)
                    Spacer()
                    Text("Trailing").foregroundColor(Color.white).padding(.trailing)
                }.border(Color.orange)
                
                HStack(alignment: .bottom) {
                    Rectangle().frame(width: 25,height: 100).foregroundColor(Color.orange)
                    Text("Leading").foregroundColor(Color.white)
                    Spacer()
                    Text("Center").foregroundColor(Color.white)
                    Spacer()
                    Text("Trailing").foregroundColor(Color.white).padding(.trailing)
                }.border(Color.orange)
                
                
                ZStack(alignment: .bottomTrailing) {
                    Image("yosemite").resizable().frame(width: 350, height: 150)
                    
                    Rectangle().frame(width: 350, height: 50)
                        .foregroundColor(Color.white).opacity(0.7)
                    
                    Text("Yosemite National Park")
                        .font(.title)
                        .forgroundColor(Color.gray)
                }
                
                Spacer()
            }
        }
    }
}
