//
//  AnimationView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 12/19/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

//Notes : Animation ( Start , Change & Stop) - we jut need to define start and stop states, Change will be handled automatically

//easeIn: Starts slow and then speeds up
//easeOut: Slow down at the end
//easeInOut: Start slow, speeds up and then slows down agin at the end.
//linear: Maintain a constant speed throught the duration of the animation.


struct AnimationView: View {
    @State private var change = false
    var body: some View {
        
        ScrollView(Axis.Set.vertical, showsIndicators: true) {
            VStack {
                Text("Example")
                    .font(Font.title)
                    .padding()
                
                Text("Parts of Animation")
                    .font(.subheadline)
                    .padding()
                
                Text("The button changes a variable that then change a view property.That property change causes a change on the screen")
                    .padding()
                    .background(Color.orange)
                    .frame(maxWidth: .infinity)
                
                Circle().frame(width: 50, height: 50, alignment: .center)
                    .foregroundColor(Color.orange)
                    //.offset(y: change ? 300: 0)
                    //Animate the change between start and stop states.
                    .animation(Animation.easeInOut)
                
                RoundedRectangle(cornerRadius: 20)
                    .padding()
                    .frame(width: 100, height: 100)
                    .foregroundColor(change ? Color.orange: .blue)
                    .animation(Animation.easeIn)
                
                //making use of hue rotation to change color based on angle degree rotation.
                RoundedRectangle(cornerRadius: 20)
                    .padding()
                    .frame(width: 100, height: 100)
                    .hueRotation(Angle.degrees(change ? 170 : 0))
                    .foregroundColor(change ? Color.orange: .blue)
                
                //animatable offset property
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color.blue)
                    .offset(x: change ? 140 : -140, y: 0)
                    .animation(.linear)
                
                //animatable opacity  property
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color.blue)
                    .opacity(change ? 0: 1)
                    .animation(.linear)
                
                //animatable rotation property
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 50 , height: 50)
                    .padding()
                    .foregroundColor(Color.blue)
                    .rotationEffect(Angle.degrees(change ? 0 : 220)/*anchor: .topLeading*/)
                    .animation(.easeInOut)
                
                //Spacer()
               
                Button(action: {
                    self.change.toggle()
                }) {
                    Text("Change")
                }.padding(.bottom)
            }
        }
    }
}
