//
//  ProgressBar.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 4/1/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI
import Combine

enum AnimationStatus {
    case start(index:Int)
    case stop(index:Int)
    case stopAll
}

struct BoxView: View {
    var index: Int
    @State private var animate = false
    var publisher:PassthroughSubject<AnimationStatus, Never>
    var body: some View {
        Rectangle()
            .foregroundColor(Color.green)
            .frame(width: 50, height: 10)
            .opacity(animate ? 1: 0.2)
            .animation(.easeInOut)
            .onReceive(publisher) { (value) in
                switch value {
                case .start(let index):
                    if index == self.index {
                        self.animate = true
                    } else {
                        self.animate = false
                    }
                case .stop(let index):
                    if index == self.index {
                        self.animate = false
                    }
                case .stopAll:
                    self.animate = false
                }
        }
    }
}

struct ProgressBarView: View {
    var maxCount = 6
    @State private var currentIndex:Int = 0
    @State private var maxIterations:Int = 0
    @State private var publisher = PassthroughSubject<AnimationStatus, Never>()
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<maxCount) { index in
                BoxView(index: index, publisher: self.publisher)
            }
        }.onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (timer) in
                if self.maxIterations < 10 {
                    if self.currentIndex < self.maxCount {
                        self.publisher.send(AnimationStatus.start(index: self.currentIndex))
                        self.currentIndex += 1
                    } else if self.currentIndex == self.maxCount {
                        self.currentIndex = 0
                        self.maxIterations += 1
                    }
                } else {
                    self.publisher.send(.stopAll)
                    self.publisher.send(.start(index: 0))
                }
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
//    var body: some View {
//        GeometryReader { proxy in
//            VStack(alignment: .trailing) {
//                Text("Progress: \(self.getPercentage(self.value))")
//                    .padding()
//                ZStack(alignment: .leading) {
//                    Rectangle().opacity(0.1).frame(height:10)
////                    Rectangle()
////                        .foregroundColor(Color.green)
////                        .frame(minWidth: 0, idealWidth:self.getProgressBarWidth(geometry: proxy),
////                               maxWidth: self.getProgressBarWidth(geometry: proxy))
////                        .frame(height: 10)
//                    HStack(spacing: 8) {
//                        ForEach(0..<5) { _ in
//                            Rectangle().foregroundColor(Color.green)
//                            //.frame(width: 80, height: 10)
//                            .frame(minWidth: 0, idealWidth:self.getProgressBarWidth(geometry: proxy)/5,
//                                                           maxWidth: self.getProgressBarWidth(geometry: proxy)/5)
//                                .frame(height: 10)
//                        }
//                    }
//                }.padding(.horizontal, 10)
//            }.onAppear {
//                Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (timer) in
//                    self.value += 0.1
//                    if self.value >= 0.9 {
//                        timer.invalidate()
//                    }
//                }
//            }.animation(.default)
//        }
//    }
    
//    func getProgressBarWidth(geometry:GeometryProxy) -> CGFloat {
//        let frame = geometry.frame(in: .global)
//        return frame.size.width * value
//    }
//
//    func getPercentage(_ value:CGFloat) -> String {
//        let intValue = Int(ceil(value * 100))
//        return "\(intValue) %"
//    }
}

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
