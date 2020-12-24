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
    let circleProgress = 10
    @State private var show = false
    @State private var percentage:CGFloat = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
       
    
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
                //.trim(from: show ? 0 : 1, to: percentage)
                .trim(from: 0, to: percentage)
                .stroke(linearGradient, style: StrokeStyle(lineWidth: 8, lineCap: CGLineCap.round))
                .shadow(radius: 4)
                //.rotationEffect(.degrees(-100))
                .rotation3DEffect(Angle.degrees(360), axis: (x: 1, y: 0, z: 0))
                .frame(height: 70)
                .overlay(
                    HStack(spacing: 2) {
                        Text("\(String(format: "%.f", percentage * 100))")
                            .font(.system(size: 16, weight: Font.Weight.bold))
                            .padding(.leading,8)
                        Text("%").foregroundColor(Color.gray)
                            .font(.system(size: 14, weight: Font.Weight.bold))
                })
              .animation(.easeOut)
              .onTapGesture {
                    self.show.toggle()
             }
        }.onReceive(timer) { time in
            if Int(self.percentage) >= 1 {
                self.timer.upstream.connect().cancel()
                print("\(self.percentage)")

              } else {
                self.percentage += 0.10
                print("The time is now \(self.percentage)")
            }
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

struct ProgressRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressRowView()
    }
}
