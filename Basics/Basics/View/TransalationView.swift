//
//  Transalation.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/10/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct TransalationView: View {
    @State private var applyEffect = false
    var body: some View {
        VStack {
           Text("Use Transalatiob effect to apply a transalation, this basically means to change the position or offset a view")
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .background(Color.purple)
            
            Spacer()
            
            Image(systemName: "arrow.up.right")
                .font(.largeTitle)
                .padding(.leading, 90)

            Image(systemName: "paperplane.fill")
                .font(.largeTitle)
                .foregroundColor(.purple)
                //.transformEffect(applyEffect ? CGAffineTransform(translationX: 140, y: -140) : .identity) // .identity removes all transformations.
                //.offset(applyEffect ? CGSize(width: 140, height: -140) : CGSize.zero) //above anf this one are same
                //.transformEffect(applyEffect ? CGAffineTransform(rotationAngle: CGFloat(Angle.degrees(-180).radians)) : .identity)
                //.transformEffect(applyEffect ? CGAffineTransform(scaleX: 2, y: 2) : .identity)
                //.border(Color.red)
                .scaleEffect(applyEffect ? CGSize(width: 2, height: 2) : CGSize(width: 1, height: 1))
                .animation(.easeIn)
            
//            Image(systemName: "pencil.and.outline")
//                .font(.system(size: 100))
//                .foregroundColor(Color.red)
//                .rotationEffect(applyEffect ? Angle.degrees(180) : Angle.zero)
            
            Spacer()
            
            HStack {
                Spacer()
                Button(action: {
                    self.applyEffect = true
                }) {
                    Text("Apply Effect")
                }
                
                Spacer()
                
                Button(action: {
                    self.applyEffect = false
                }) {
                    Text("Remove Effect")
                }
                
                Spacer()
            }
            
        }
       
    }
}
