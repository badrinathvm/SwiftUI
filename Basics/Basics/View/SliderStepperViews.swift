//
//  SliderStepperViews.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/3/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct SliderStepperView: View {

    @State private var sliderValue = 0.5
    @State private var stepper = 1
    @State private var values = [0,1]
    @State private var starValue = 1
    @State private var contrast = 50

    var body: some View  {
        VStack {
            HStack {
                Image(systemName: "tortoise")
                Slider(value: $sliderValue)
                Image(systemName: "hare")
            }.padding(.horizontal).foregroundColor(.accentColor)
            
            
            HStack {
                Image(systemName: "speaker.fill")
                Slider(value: $sliderValue)
                Image(systemName: "speaker.3.fill")
            }.padding(.horizontal)
          
        
            VStack {
                Slider(value: $sliderValue)
                
                HStack {
                    Image(systemName: "circle").foregroundColor(.orange)
                    Spacer()
                    Image(systemName: "circle.righthalf.fill").foregroundColor(.orange)
                    Spacer()
                    Image(systemName: "circle.fill").foregroundColor(.orange)
                }
            }.padding().accentColor(.orange)
            
            
            Stepper(value: $stepper) {
                Text("Bound Stepper : \(stepper)")
            }.padding(.horizontal)
            
            Stepper(onIncrement: {
                self.values.append(self.values.count)
            }, onDecrement: {
                self.values.removeLast()
            }) {
                Text("On Increment and On Decremnt")
            }.padding(.horizontal)
            
            HStack {
                ForEach(self.values, id: \.self) { value in
                    Image(systemName: "\(value).circle.fill")
                }
              }.font(.title).foregroundColor(.green)
            
            VStack {
                Stepper(value: $starValue, in:1...5) {
                    Text("Rating")
                }
                HStack {
                    ForEach(1...starValue, id: \.self) { value in
                        Image(systemName: "star.fill").foregroundColor(.yellow)
                    }
                }.padding(.horizontal)
            }.padding()
            
            VStack {
                HStack {
                    Text("My Custom Color")
                    Spacer()
                    Stepper("", value: $contrast)
                        .frame(width: 94 , height: 33)
                        .offset(x: -4)
                        .background(Color(UIColor.systemOrange))
                        .cornerRadius(8)
                }
            }
            
           Spacer()
        }.padding()
    }
}
