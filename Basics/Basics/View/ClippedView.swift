//
//  ClippedView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/10/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct ClippedView: View  {
    var body: some View {
        VStack {
            HStack(spacing: 50) {
                Image("y1")
                .resizable()
                .scaledToFill()
                    .border(Color.red)
                .frame(width: 100, height: 80)

                Image("y1")
                .resizable()
                     .border(Color.red)
                .frame(width: 100, height: 80)
                .clipped()
            }.padding()

            HStack {
                Image("y1").resizable().frame(height: 100 ).clipShape(Circle()).padding()
                Image("y1").resizable().frame(height: 100).clipShape(RoundedRectangle(cornerRadius: 20))
                Image("y1").resizable().frame(height: 100).mask(Circle())
            }.padding(.horizontal, 10)


            HStack {
                Image("y1")
                    .resizable().frame(width: 200, height: 100)
                    .contrast(0.6)
                    .mask(Text("Nature").fontWeight(.black).font(.system(size: 30)))
            }.padding(.horizontal)

            HStack {
                //add an offset to mask to move it down
                Image("y1").resizable().frame(height: 100).mask(Image(systemName: "heart.fill").offset(y: 15))
            }.font(.system(size: 100))
            
            HStack {
                GeometryReader { gr in
                    Image("y1").resizable().frame(height: 100)
                        .mask(Image(systemName: "heart.fill").position(x: gr.size.width / 2, y: gr.size.height / 2))
                }.frame(height: 100)
            }.font(.system(size: 100))
            
            //bottom 20 portion is masked.
            HStack {
                Image("y1")
                .resizable()
                    .frame(height: 100)
                    .mask(Rectangle().padding(.bottom, 20))
                    .border(Color.orange)
            }.font(.title)


          
//            Button(action: {}) {
//                Text("Explore")
//                    .foregroundColor(Color.white)
//                    .font(.body)
//            }
//            .frame(width: 200 , height: 75)
//            .background( Image("y1")
//            .resizable()
//            .frame(height: 100)
//            .mask(Capsule()))
            Spacer()
        }
    }
}
