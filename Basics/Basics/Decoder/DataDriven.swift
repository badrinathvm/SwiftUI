//
//  DataDriven.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 7/21/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

protocol Render {
    func renderView(asset: Asset) -> AnyView
}

struct DataDrivenView: View, Render {
    
    var body: some View {
        return loadView(for: JSONLoader.decode(for: JSONLoader.unbox(for: "sample")))
    }
    
    func renderView(asset: Asset) -> AnyView {
        return VStack {
            asset.heading.render()
            asset.subHeading.render()
        }.eraseToAnyView()
    }
}

