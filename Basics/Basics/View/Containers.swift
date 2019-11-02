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

struct Containers: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            ForEach(0..<4) { _ in
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color.orange)
                    .frame(width: 320, height: 150)
            }
        }.padding()
            .background(RoundedRectangle(cornerRadius: 20).stroke(Color.orange, lineWidth: 4))
    }
}
