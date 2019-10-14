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
    @State private var showingAlert = false
    
    var countries = ["estonia", "france", "germany", "ireland", "italy", "nigeria", "poland", "russia", "spain", "uk", "us"]
    var correctAnswer = Int.random(in: 0...2)
    
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
        
//        VStack(alignment: .leading, spacing: 20) {
//            Button(action: {
//                print("Edit Button Tapped")
//            }) {
//                HStack(spacing: 10.0) {
//                    Image(systemName: "pencil")
//                    Text("Edit")
//                }
//            }
//
//            Button(action: {
//                //self.showingAlert = true
//                  Alert.init(title: Text("Hello Swift UI"), message: Text("Content is Awesome:"), dismissButton: .default(Text("OK")))
//            }) {
//                Text("Show Alert")
//            }
//
//        }
        
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            //LinearGradient(gradient: Gradient(colors: [Color.white, Color.black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            //LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 30) {
                VStack {
                    Text("Tap the flag")
                      .font(.largeTitle)
                     .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
            
                ForEach(0..<3) { number in
                    Button(action: {
                        
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                    }
                }
                
                //pushes to the top
                Spacer()
            }
        }
    }
}
