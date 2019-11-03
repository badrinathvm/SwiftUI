//
//  ScrollHorizontalView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/3/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct ScrollHorizontalView: View {
    
    var colors = [Color.green, Color.blue, Color.purple, Color.pink,                 Color.yellow, Color.orange]
    
    var body: some View {
        GeometryReader { gr in
            VStack {
                Spacer()
                ScrollView(Axis.Set.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(self.colors, id: \.self) { item in
                            RoundedRectangle(cornerRadius: 15)
                                .fill(item)
                                .frame(width: gr.size.width - 60, height: 200)
                        }
                    }
                }
                Spacer()
            }.padding()
        }
    }
}

