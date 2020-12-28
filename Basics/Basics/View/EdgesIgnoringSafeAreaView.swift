//
//  EdgesIgnoringSafeAreaView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/10/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct EdgesIgnoringInsetView: View {
    var body: some View {
        TabView {
            VStack(spacing: 20) {
                Text("Edges Ignoring Safe Area")
                    .padding(.top, 60)
                    .padding(.bottom, 20)
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.white)
                    .background(Color.red)
                
                Spacer()
            }.edgesIgnoringSafeArea(.top)
            .tabItem { Text("First") }
        }
        
    }
}

struct EdgesIgnoringSafeAreaView_Previews: PreviewProvider {
    static var previews: some View {
        EdgesIgnoringInsetView()
    }
}
