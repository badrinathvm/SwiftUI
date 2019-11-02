//
//  Containers.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/1/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

//Key Points : In order to add a border, we need to make use of background property.
//Segregating in to small sections.

struct Containers: View {
    
    private var horizontalView: some View {
        HStack(alignment: VerticalAlignment.center, spacing: 20) {
            ForEach(0..<3) { _ in
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color.orange)
                    .frame(width: 100, height: 180)
            }
        }.padding()
            .background(RoundedRectangle(cornerRadius: 20).stroke(Color.orange, lineWidth: 10))
    }
    
    private var verticalView: some View {
        VStack(alignment: .leading, spacing: 40) {
            ForEach(0..<3) { _ in
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color.orange)
                    .frame(width: 320, height: 150)
            }
        }.padding()
            .background(RoundedRectangle(cornerRadius: 20).stroke(Color.orange, lineWidth: 4))
    }
    
    var body: some View {
        VStack {
            verticalView
            //acts like a spacer.
            Color.white.frame(width: UIScreen.main.bounds.size.width, height: 20)
            horizontalView
        }
    }
}
