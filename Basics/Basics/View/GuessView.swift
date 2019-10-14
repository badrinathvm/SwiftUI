//
//  GuessView.swift
//  Basics
//
//  Created by Badarinath Venkatnarayansetty on 10/13/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct GuessView: View {
    var body: some View {
        //place two text vertcally aligned leading.
//        VStack(alignment: .leading, spacing: 20.0) {
//            Text("First Vertical Text")
//            Text("Second Verical Text")
//        }
        
//        HStack(spacing: 20.0) {
//            Text("First  Text")
//            Text("Second Text")
//        }
        
        //ZStack draws its contents from top to bottom, back to front. This means if you have an image then some text ZStack will draw them in that order, placing the text on top of the image.
        
        //if we wanto have ZStack background color
//        ZStack(alignment: .top) {
//            //this covesr the safe area as well.
//            Color.red.edgesIgnoringSafeArea(.all)
//            Text("Content")
//        }
        
           //LinearGradient(gradient: Gradient(colors: [Color.white, Color.black]), startPoint: .top, endPoint: .bottom)
        
        //Buttons and Images
        Button(action: {
            print("Edit Button Tapped")
        }) {
            HStack(spacing: 10.0) {
                Image(systemName: "pencil")
                Text("Edit")
            }
        }
    }
}
