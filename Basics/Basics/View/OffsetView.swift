//
//  OffsetView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/10/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct Offsetview: View {
    var body: some View {
        Group {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.green)
                    .frame(width: 200, height: 100)
                    .shadow(radius: 5)
                    .offset(x: -20, y: -20)
                
                RoundedRectangle(cornerRadius: 20)
                .fill(Color.green)
                .frame(width: 200, height: 100)
                .shadow(radius: 5)
                
                RoundedRectangle(cornerRadius: 20)
                .fill(Color.green)
                .frame(width: 200, height: 100)
                .shadow(radius: 5)
                .offset(x: 20, y: 20)
                    //.border(Color.red)
            }.padding()
            
            Text("Note, only the conetents of the view are offset, not the view itself. The location of the original view remains the same. The red border shows the actual location of the rectangle's frame")
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(Color.white)
                .background(Color.green)
        }
    }
}
