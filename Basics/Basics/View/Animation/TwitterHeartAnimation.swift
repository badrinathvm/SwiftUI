//
//  TwitterHeartAnimation.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 7/19/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

struct TwitterHeartAnimation: View {
    @State private var showHeart:Bool = false
    @State private var showSplashTilted:Bool = false
    var body: some View {
        VStack {
            ZStack {
                Image(systemName: "heart")
                .frame(width: 150, height: 150)
                .foregroundColor(.pink)
                
                Image(systemName: "heart.fill")
                    .frame(width: 150, height: 150)
                    .foregroundColor(Color.pink)
                    .scaleEffect(showHeart ? 1.1 : 0)
                    .animation(Animation.interactiveSpring().delay(0.2))
                
                Image("splash_tilted")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .scaleEffect(showSplashTilted ? 1.5 : 0)
                    .scaleEffect(1.1)
                    .animation(Animation.easeOut(duration: 0.5).delay(0.1))
            }.onTapGesture {
                self.showHeart.toggle()
                self.showSplashTilted.toggle()
            }
        }
    }
}

struct TwitterHeartAnimation_Previews: PreviewProvider {
    static var previews: some View {
        TwitterHeartAnimation()
    }
}
