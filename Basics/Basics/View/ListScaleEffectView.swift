//
//  ListScaleEffectView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 12/20/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI
// lastTextBaseline aligns the images to the bottom.
struct ListScaleEffectView: View {
    @State private var scale:Bool = false
    @State private var scalingFactor: CGFloat = 0
    
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
         .scaleEffect(self.scale ? 1.05 : 1)
         .padding(.horizontal, 20)
//         .modifier(ReversingScale(to: scalingFactor, onEnded: {
//                DispatchQueue.main.async {
//                    self.scalingFactor = 1
//                }
//        }))
    }
    

    var body: some View {
        VStack(spacing: 30) {
            Button(action: {
                let animation = Animation.easeInOut(duration: 0.5).repeatCount(1, autoreverses: true)
                withAnimation(animation) {
                    self.scalingFactor = 1.05
                    self.scale.toggle()
                }
                //reset the animation back.
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation(animation) {
                        self.scale.toggle()
                    }
                }
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


extension VerticalAlignment {
    private enum MidAlignemnt: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context[.bottom]
        }
    }
    
    static let midAlignment = VerticalAlignment(MidAlignemnt.self)
    
    private enum Topalignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context[.top]
        }
    }
    
    static let topAlignment = VerticalAlignment(Topalignment.self)
}

struct ListScaleEffectView_Previews: PreviewProvider {
    static var previews: some View {
        ListScaleEffectView()
    }
}



struct ReversingScale: AnimatableModifier {
    var value: CGFloat

    private var target: CGFloat
    private var onEnded: () -> ()

    init(to value: CGFloat, onEnded: @escaping () -> () = {}) {
        self.target = value
        self.value = value
        self.onEnded = onEnded // << callback
    }

    var animatableData: CGFloat {
        get { value }
        set { value = newValue
            // newValue here is interpolating by engine, so changing
            // from previous to initially set, so when they got equal
            // animation ended
            if newValue == target {
                onEnded()
            }
        }
    }

    func body(content: Content) -> some View {
        content.scaleEffect(value)
    }
}
