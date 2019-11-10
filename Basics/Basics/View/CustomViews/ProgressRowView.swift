//
//  ProgressRowView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/10/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct CircularRingView: View {
    let circleProgress = 85
    var body: some View {
        let gradient = Gradient(colors: [.purple, .blue])
        let linearGradient = LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
        //rgb(245,245,245)
        return ZStack {
            Circle()
                .trim(from: 0, to: 1)
                .stroke(Color(red: 245/255, green: 245/255, blue: 245/255), lineWidth: 10)
                .frame(height: 80)
            Circle()
                .trim(from: 0, to: 0.75)
                .stroke(linearGradient, style: StrokeStyle(lineWidth: 8, lineCap: CGLineCap.round))
                .shadow(radius: 4)
                .rotationEffect(.degrees(-70))
                .frame(height: 70)
                .overlay(
                    HStack(spacing: 2) {
                        Text("\(circleProgress)")
                            .font(.system(size: 16, weight: Font.Weight.bold))
                            .padding(.leading,8)
                        Text("%").foregroundColor(Color.gray)
                            .font(.system(size: 14, weight: Font.Weight.bold))
                })
        }
    }
}

struct ProgressRowView : View {
    var body: some View {
        ZStack {
            Color(red: 245/255, green: 245/255, blue: 245/255)
            HStack {
                CircularRingView().frame(width: 70).padding()
                VStack(alignment: .leading) {
                    Text("6 minutes left").font(.system(size: 20, weight: Font.Weight.bold))
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 5, trailing: 0))
                    Text("Watched 10 mins today").foregroundColor(.gray).font(.system(size: 18, weight: Font.Weight.regular))
                    Spacer()
                }.padding(EdgeInsets(top: 0, leading: 2, bottom: 0, trailing: 0))
                Spacer()
            }.frame(width: 350 , height: 80)
                .padding(.vertical, 4)
                .background(RoundedRectangle(cornerRadius: 24)
                    .foregroundColor(Color.white)
                    .shadow(color:Color(red: 248/255, green: 248/255, blue: 255/255), radius: 4))
        }
    }
}
