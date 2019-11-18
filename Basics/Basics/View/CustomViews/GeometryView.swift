//
//  GeometryView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/17/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct TileView: View {
    var title: String
    var body: some View {
        Image(title)
            .resizable()
            .frame(width : 375, height: 200, alignment: .bottom)
            .cornerRadius(20)
            .padding()
            .overlay(Text(title.uppercased())
                .padding(.top, 100)
                .foregroundColor(Color.white)
                .font(.system(size: 30, weight: .black)))
    }
}

struct GeometryView: View {
    var body: some View {
        ScrollView(Axis.Set.vertical, showsIndicators: false) {
            ZStack {
//                GeometryReader { gr in
//                    Image("map")
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .scaleEffect(1.8)
//                        .blur(radius: 1)
//                        .opacity(0.4)
//                        .offset(y: -gr.frame(in: .global).origin.y / 2)
//                }
                VStack(spacing: 20) {
                        TileView(title: "Arches").cornerRadius(20)
                        TileView(title: "BryceCanyon")
                        TileView(title: "Canyonlands")
                        TileView(title: "GoblinValley")
                        TileView(title: "Zion")
                }.padding(.horizontal, 40).padding(.top, 300)
                
                GeometryReader { gr in
                    VStack{
                        Image("Utah")
                        .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: self.calculateFrameHeight(minHeight: 120, maxHeight: 300, yOffset: gr.frame(in: .global).origin.y))
                            //.shadow(radius: self.calculateFrameHeight(minHeight: 120, maxHeight: 300, yOffset: gr.frame(in: .global).origin.y) < 140 ? 8 : 0)
                            .overlay(Text("UTAH").foregroundColor(Color.white).font(.system(size: 70, weight: .black)))
                            //logic - if the image is scrolling up say for eg : -100 // push it down  else
                            .offset(y: gr.frame(in: .global).origin.y < 0 ? abs(gr.frame(in: .global).origin.y) : -gr.frame(in: .global).origin.y)
                        Spacer()
                    }
                }
            }.edgesIgnoringSafeArea(.vertical)
        }
    }
    
    func calculateFrameHeight(minHeight: CGFloat , maxHeight: CGFloat, yOffset: CGFloat) -> CGFloat{
        // if scrolling up , yOffset will be a negative number
        if maxHeight + yOffset < minHeight {
            // never go beyond the min height
            return minHeight
        }
        else if maxHeight + yOffset > maxHeight {
            //scrolling down past max height
            return maxHeight + (yOffset * 0.5)
        }
        
        //scrolling down , we should full hieght of the image plus yoffet to get strtchy behaviour.
        return maxHeight + yOffset
    }
}


//abs(gr.frame(in: .global).origin.y : -gr.frame(in: .global).origin.y)





// this shows how "Y" axis varies.
struct GeometryDemoView : View {
    var body: some View {
        ScrollView(Axis.Set.vertical, showsIndicators: false) {
        GeometryReader { gr in
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.purple)
                .padding(.horizontal)
                .overlay(
                    VStack{
                        Text("X: \(gr.frame(in: .global).origin.x)")
                        Text("Y: \(gr.frame(in: .global).origin.y)")
                })
            .background(Image("y1"))
        }.frame(height: 200)
        
        GeometryReader { gr in
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.yellow)
                .padding(.horizontal)
                .overlay(
                    VStack{
                        Text("X: \(gr.frame(in: .global).origin.x)")
                        Text("Y: \(gr.frame(in: .global).origin.y)")
                })
        }.frame(height: 200)
        
        GeometryReader { gr in
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.orange)
                .padding(.horizontal)
                .overlay(
                    VStack{
                        Text("X: \(gr.frame(in: .global).origin.x)")
                        Text("Y: \(gr.frame(in: .global).origin.y)")
                })
        }.frame(height: 200)
     }
    }
}
