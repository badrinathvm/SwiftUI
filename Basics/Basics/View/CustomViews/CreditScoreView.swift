//
//  CreditScoreView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/15/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct CreditScoreView: View {
    var body: some View {
        VStack {
            MeterView()
            Spacer()
        }
    }
}

struct MeterView: View {
    var body: some View {
              ZStack {
                  Circle()
                      .trim(from: 0, to: 0.5)
                      .stroke(Color(red: 245/255, green: 245/255, blue: 245/255), style: StrokeStyle(lineWidth: 30, lineCap: CGLineCap.round))

                  Circle()
                  .trim(from: 0, to: 0.05)
                  .stroke(Color(red: 71/255, green: 178/255, blue: 101/255, opacity: 1.0), style: StrokeStyle(lineWidth: 30, lineCap: CGLineCap.round))

                  Circle()
                  .trim(from: 0, to: 0.10)
                      .stroke(Color(red: 71/255, green: 178/255, blue: 101/255), lineWidth: 30)

                  Circle()
                      .trim(from: 0.10, to: 0.15)
                      .stroke(Color(red: 96/255, green: 178/255, blue: 119/255).opacity(0.5), lineWidth: 30)

                  Circle()
                      .trim(from: 0.10, to: 0.16)
                      .stroke(Color.green.opacity(0.5), lineWidth: 30)

                  Circle()
                      .trim(from: 0.16, to: 0.20)
                      .stroke(Color.green.opacity(0.5), lineWidth: 30)

                  //yellow cut of circle
                  Circle()
                  .trim(from: 0.20, to: 0.25)
                      .stroke(Color.yellow.opacity(0.5), lineWidth: 30)

                  //larger red circle portion
                  Circle()
                  .trim(from: 0.25, to: 0.50)
                      .stroke(Color.red.opacity(0.5), style:StrokeStyle(lineWidth: 30))

                  //top cap semi circle
                  Circle()
                      .trim(from: 0 , to : 0.5)
                      .frame(height: 30)
                      .foregroundColor(Color.red.opacity(0.5))
                      .rotationEffect(.degrees(-180))
                      .offset(x: -125.1)
              }.frame(height: 250)
                  .overlay(
                      VStack {
                        Text("Max")
                            .font(.system(size: 30, weight: Font.Weight.bold))
                            .foregroundColor(Color(red: 71/255, green: 178/255, blue: 101/255, opacity: 1.0))
                            .offset(y: 20)
                        Image(systemName: "arrowtriangle.down.fill")
                            .rotationEffect(.degrees(-70))
                            .offset(x: 80, y: 20)
                            .foregroundColor(Color(red: 71/255, green: 178/255, blue: 101/255))
                            .rotation3DEffect(Angle.degrees(-70), axis: (x: 0, y: 0, z: 1))
                            .animation(.easeOut)
                  })
    }
}

