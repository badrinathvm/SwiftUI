//
//  AddToCartView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 2/2/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI


struct AddToCartView: View {
    @State private var taps: Int = 0
    var body: some View  {
        Button("Empty Cart") {
            withAnimation(.linear(duration: 0.5)) {
                self.taps += 1
            }
        }
        .shake(times: taps * 3)
    }
}


//struct CustomShape: Shape {
//    func path(in rect: CGRect) -> Path {
//        let bezierPath = UIBezierPath()
//        bezierPath.move(to: CGPoint(x: 170, y: 60))
//        bezierPath.addQuadCurve(to: testImage.center, controlPoint: CGPoint(x:testImage.center.x, y:itemImage.center.y ))
//
//        return bezierPath
//    }
//}

struct MyEffect: GeometryEffect {
    var x : CGFloat = 0
    
    var animatableData: CGFloat {
        get { x }
        set { x = newValue }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        return ProjectionTransform(CGAffineTransform(translationX: x, y: 0))
    }
}

struct LabelView: View {
    let text: String
    var offset: CGFloat
    var pct: CGFloat
    let backgroundColor: Color

    var body: some View {

        Text("The SwiftUI Lab")
            .font(.headline)
            .padding(5)
            .background(RoundedRectangle(cornerRadius: 5).foregroundColor(backgroundColor))
            .foregroundColor(Color.black)
            .modifier(SkewedOffset(offset: offset, pct: pct, goingRight: offset > 0))

    }
}

struct SkewedOffset: GeometryEffect {
    var offset: CGFloat
    var pct: CGFloat
    let goingRight: Bool

    init(offset: CGFloat, pct: CGFloat, goingRight: Bool) {
        self.offset = offset
        self.pct = pct
        self.goingRight = goingRight
    }

    var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get { return AnimatablePair<CGFloat, CGFloat>(offset, pct) }
        set {
            offset = newValue.first
            pct = newValue.second
        }
    }

    func effectValue(size: CGSize) -> ProjectionTransform {
        var skew: CGFloat

        if pct < 0.2 {
            skew = (pct * 5) * 0.5 * (goingRight ? -1 : 1)
        } else if pct > 0.8 {
            skew = ((1 - pct) * 5) * 0.5 * (goingRight ? -1 : 1)
        } else {
            skew = 0.5 * (goingRight ? -1 : 1)
        }

        return ProjectionTransform(CGAffineTransform(a: 1, b: 0, c: skew, d: 1, tx: offset, ty: 0))
    }
}
/*
        // return VStack(spacing: 20) {
             
             
 //            Spacer()
 //            HStack(spacing: 10) {
 //                Spacer()
 //                Image("credit_card")
 //                .resizable()
 //                .frame(height: 40)
 //                .aspectRatio(contentMode: ContentMode.fit)
 //                .animation(addToCartFlag ? Animation.easeInOut(duration: 2).delay(1) : .none)
 //                Button("Add To Cart") {
 //                    self.addToCartFlag.toggle()
 //                }.padding()
 //
 //                Button("Empty Cart") {
 //                    self.emptyCart.toggle()
 //                }
 //
 //                Spacer()
 //            }.padding()
 //
 //            Spacer()
 //
 //            Button("Empty Cart") {
 //                self.moveIt.toggle()
 //            }
             
 //            Image("cart_filled")
 //                .resizable()
 //                .frame(height: 40)
 //                .aspectRatio(contentMode: ContentMode.fit)
 //                //.position(moveIt ? CGPoint(x: 40, y: 0) : CGPoint(x: -40, y: 0))
 //                .animation(Animation.easeInOut(duration: 1.0).repeatCount(2, autoreverses: true))
             
 //            if moveIt {
 //                Image(!moveIt ? "cart_filled" : "cart")
 //                    .resizable()
 //                    .offset(x: 150, y: 0)
 //                    .frame(height: 40)
 //                    .aspectRatio(contentMode: ContentMode.fit)
 //                    .transition(!moveIt ? AnyTransition.move(edge: .trailing) : AnyTransition.move(edge: .leading))
 //                    .animation(Animation.easeInOut(duration: 1.0).repeatCount(3, autoreverses: true))
 //            }
 //            }else {
 //                Image("cart_filled")
 //                .resizable()
 //                .offset(x: 150, y: 0)
 //                .frame(height: 40)
 //                .aspectRatio(contentMode: ContentMode.fit)
 //            }
   //      }
 */
