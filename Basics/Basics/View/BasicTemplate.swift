//
//  BasicTemplate.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/1/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

//Key Notes : 1. Color.white is a View
//            2. Text wont be wrapped if layoutPriority is set to (1) : default : 0

struct BasicTemplate: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Images")
                .font(.largeTitle) // because it sets the font again , local gets priority over global i.e, largetitle is applied to "Images" and .title is applied to remaining two components
            Text("Using SF Symbols")
                .foregroundColor(Color.gray)
            Text("You will see I use icons or symbols to add clarity to what i'm demonstrating.These come from Apple's new symbol font library which you can browse using an app called 'SF Symbol'")
                .frame(maxWidth: .infinity) // Extend until you can't go anymore
                .padding()
                .foregroundColor(Color.white)
                .background(Color.blue)
                .layoutPriority(1)
            Image(systemName: "hand.thumbsup.fill")
                .font(.largeTitle)
            Image("SF Symbols")
            Spacer() // moves the content to Top
        }.font(.title)
            .edgesIgnoringSafeArea(.bottom)
    }
}
