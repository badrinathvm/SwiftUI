//
//  ViewSizesPushOut.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/2/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct ViewSizesPushOut: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Layout Behaviour")
            Text("Views that Push out")
                .foregroundColor(Color.gray)
            CustomText(text: "Some Viewswill push out to fill up all available.space within their parent")
            
            Color.purple
                .overlay(Image(systemName: "arrow.up.left").padding().foregroundColor(Color.white), alignment: .topLeading)
                .overlay(Image(systemName: "arrow.up.right").padding().foregroundColor(Color.white), alignment: .topTrailing)
                .overlay(Image(systemName: "arrow.down.left").padding().foregroundColor(Color.white), alignment: .bottomLeading)
                .overlay(Image(systemName: "arrow.down.right").padding().foregroundColor(Color.white), alignment: .bottomTrailing)
                .overlay(Text("Colors are Push-out Views").foregroundColor(Color.white))
        }.font(.largeTitle)
    }
}
