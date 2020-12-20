//
//  HeroAnimationView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 12/16/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
struct HeroAnimationView: View {
    @Namespace var nspace
    @State private var flag:Bool = false
    
    fileprivate func expandedView()  -> some View {
        return
            HStack(alignment: .bottom, spacing: 0) {
                Rectangle().fill(Color.green)
                    .frame(height: 121,alignment: .bottom)
                    .cornerRadius(8.0, corners: [.topLeft, .topRight])
                
                Rectangle().fill(Color(pink03))
                    .frame(height: 150,alignment: .bottom)
                    .cornerRadius(8.0, corners: [.topLeft, .topRight])
                    .offset(x: -30)
            }.padding(.horizontal, 16)
    }
    
    fileprivate func initialView() -> some View {
        return
                HStack(alignment: .bottom, spacing: 0) {
                    Rectangle().fill(Color.green)
                    .frame(height: 10, alignment: .bottom)
                    .cornerRadius(8.0, corners: [.topLeft, .topRight])

                  
                    Rectangle().fill(Color(pink03))
                    .frame(height: 40, alignment: .bottom)
                    .cornerRadius(8.0, corners: [.topLeft, .topRight])
                    .offset(x: -30)
            }.padding(.horizontal, 16)
            
    }
    
    
    var body: some View {
        VStack(spacing: 0) {
            if flag {
                expandedView()
                    .matchedGeometryEffect(id: "geoEffect", in: nspace, isSource: true)
                    .frame(height: 250)
                    .onTapGesture {
                        self.flag.toggle()
                    }
                    .offset(y: 18)
            } else {
                initialView()
                    .matchedGeometryEffect(id: "geoEffect", in: nspace, isSource: false)
                    .frame(height: 100)
                    .onTapGesture {
                        self.flag.toggle()
                    }
                    
            }
        }
        .frame(maxHeight: 300, alignment: .bottom) // TODO:: Calculate dynamically.
        .offset(y: 30.0)
        //.border(Color.black)
        .animation(.ripple())
    }
}

extension Animation {
    static func ripple() -> Animation {
        Animation.spring(dampingFraction: 1.0)
            .speed(2)
    }
}

@available(iOS 14.0, *)
struct HeroAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        HeroAnimationView()
    }
}
