//
//  ListScaleEffectView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 12/20/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

struct ListScaleEffectView: View {
    @State private var scale:Bool = false
    @State private var scalingFactor: CGFloat = 1
    
    var images = ["airplane.circle.fill", "bag.circle", "arrowshape.zigzag.forward.fill"]
    
    func listBodyView(_ image: String) -> some View {
        return  HStack(alignment: .midAlignment, spacing: 16) {
            Image(systemName: image)
                .resizable()
                .frame(width: 40, height: 40)
                .alignmentGuide(.midAlignment) { dimension in dimension[.bottom] / 2}
                .foregroundColor(Color.red)
                        
            VStack(alignment: .leading, spacing: 5) {
                Text("Travel")
                    .foregroundColor(Color.black)
                    .font(Font.system(size: 14, weight: Font.Weight.regular))
                Text("in ~6 days")
                    .font(Font.system(size: 12, weight: Font.Weight.light))
                    .foregroundColor(Color.gray)
                    .alignmentGuide(.midAlignment) { dimension in dimension[.bottom] / 2}
                Text("$5.00")
                    .font(Font.system(size: 16, weight: Font.Weight.medium))
            }
        
           Spacer()
            
            Image(systemName: "dot.arrowtriangles.up.right.down.left.circle")
                .foregroundColor(Color.gray)
                .alignmentGuide(.midAlignment) { dimension in dimension[.bottom] / 2}
        
       }.padding()
    }
    
    func scaledRectangleView() -> some View {
        return RoundedRectangle(cornerRadius: 16)
         .frame(height: 85)
         .foregroundColor(Color.white)
         .shadow(color: Color.gray, radius: 1, x: 0, y: 0)
         .overlay(listBodyView(images[0]))
         //Approach 1: use scale Effect and reset the animation block with some timer.
         //.scaleEffect(self.scale ? 1.05 : 1)
            
            //Approach 2: Have a modifier to reverse scale the animation.
            .modifier(ReversingScale(to: scalingFactor) {
                DispatchQueue.main.async {
                    withAnimation(Animation.easeInOut(duration: 0.5)) {
                        self.scalingFactor = 1
                    }
                }
            })
        .padding(.horizontal, 20)
    }
    

    var body: some View {
        VStack(spacing: 30) {
            Button(action: {
                let animation = Animation.easeInOut(duration: 0.5)
                withAnimation(animation) {
                    self.scalingFactor = 1.05
                    self.scale.toggle()
                }
                //Approach 1: reset the animation back.
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                    withAnimation(animation) {
//                        self.scale.toggle()
//                    }
//                }
            }) {
                Text("Scale It")
                    .foregroundColor(.white)
                    .frame(width: 100, height: 20)
                    
            }.padding()
            .background(Capsule().foregroundColor(.blue))
            
            scaledRectangleView()
        }
    }
}

struct ListScaleEffectView_Previews: PreviewProvider {
    static var previews: some View {
        ListScaleEffectView()
    }
}
