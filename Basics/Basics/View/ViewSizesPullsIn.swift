//
//  ViewSizesPullIn.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/2/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

//splitting the common modifiers in to seperate struct to be used at many place later
struct BackGroundForeGroundLayoutModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.frame(maxWidth: .infinity)
            .padding()
            .background(Color.purple)
            .foregroundColor(Color.white)
            .layoutPriority(1)
            .font(.title)
    }
}

//Access the common one with the help of .modifier
struct CustomText: View {
    var text: String
    var body: some View {
        Text(text)
        .modifier(BackGroundForeGroundLayoutModifier())
    }
}


struct ViewSizesPullsIn: View {
    
    private var PullInView: some View {
        HStack {
            Image(systemName: "arrow.right.to.line.alt")
            Text("Text views pull in")
            Image(systemName: "arrow.left.to.line.alt")
        }
    }
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Layout Behaviour")
                .font(.largeTitle)
            
            Text("Views that Pull In")
                .foregroundColor(Color.gray)
            
            //created a new swiftUI view
            CustomText(text: "Some views minimize their frame size so it is only as big as the content within it")
            
            Image(systemName: "arrow.down.to.line.alt")
            
            PullInView
            
            CustomText(text:"Pull-In views tend to center themsekves within their parent container view")
                
        }.font(.title)
    }
}
