//
//  CircleAnimationTemplateView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 12/23/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

@available(iOS 14.0 , *)
struct CircleAnimationTemplateView: View {
    @State private var percentage:CGFloat = 0
    @State private var counter = 0
    @Binding var showText:Bool
    @StateObject private var networkData = Network()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var pollTime:Int = 10
    
    var body: some View {
        return ZStack {
            Circle()
                .trim(from: 0, to: 1)
                .stroke(Color(red: 245/255, green: 245/255, blue: 245/255), lineWidth: 10)
                .frame(height: 80)
            Circle()
                .trim(from: 0, to: percentage)
                .stroke(Colors.green03, style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap.round))
                .shadow(radius: 4)
                .rotation3DEffect(Angle.degrees(360), axis: (x: 1, y: 0, z: 0))
                .frame(height: 70)
                .animation(.easeOut)
        }
        //polling with networking call for 10 seconds
        .onReceive(timer) { timer in
            if self.counter < pollTime {
                self.networkData.fetchDataFromNetwork { (movies) in
                    if self.counter == pollTime {
                        self.timer.upstream.connect().cancel()
                        self.showText.toggle()
                        print("Timer Stopped ==> \(self.percentage)")
                    }
               }
               self.percentage += 0.10 // this is for the animation ring
               self.counter += 1  // keep track of the poll
            }
        }
        // polling wiht timer logic.
//        .onReceive(timer) { time in
//            if self.counter == 5 {
//                self.timer.upstream.connect().cancel()
//                print("Timer Stopped ==> \(self.percentage)")
//                self.showText.toggle()
//            } else {
//
//                self.percentage += 0.30
//            }
//            self.counter += 1
//        }
    }
}


//struct CircleAnimationTemplateView_Previews: PreviewProvider {
//    static var previews: some View {
//        CircleAnimationTemplateView(showText: false)
//    }
//}

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

