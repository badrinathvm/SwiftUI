//
//  Buttons.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/2/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct ButtonCustomModifier: ViewModifier {
    var radius:CGFloat
    func body(content: Content) -> some View {
        content.background(Color.purple)
                .foregroundColor(Color.white)
                .cornerRadius(radius)
    }
}

struct Buttons: View {
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing : 20) {
                Button(action: {}) {
                    Text("Solid Button")
                    .padding()
                    .modifier(ButtonCustomModifier(radius: 8))
                }
                
                Button(action : {} ){
                    Text("Button With Shadow")
                        .padding(12)
                        .modifier(ButtonCustomModifier(radius: 8))
                }.shadow(color: Color.purple, radius: 20, y: 5)
                
                Button(action : {} ) {
                    Text("Button with Rounded Ends")
                    .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
                        .modifier(ButtonCustomModifier(radius: .infinity))
                        //.cornerRadius(.infinity) // will give the perfect corner no matter the size of the view
                }
                
                Button(action : {}) {
                    Text("Square Border Button")
                    .padding()
                    .border(Color.purple)
                }
                
                //this button clips the corners
                Button(action : {}) {
                    Text("Rounded Square Border Button")
                    .padding()
                    .border(Color.purple)
                    .cornerRadius(10)
                }
                
                Button(action : {}) {
                    Text("Border button")
                    .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.purple, lineWidth: 2))
                }
                
                Button(action : {} ) {
                    HStack{
                        Text("Button With Symbol")
                            .padding(.horizontal)
                        Image(systemName: "gift.fill")
                    }
                    .padding()
                }
                .modifier(ButtonCustomModifier(radius: 8))
                
                Button(action: {} ){
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search").padding(.horizontal)
                    }
                    .padding()
                }
                .modifier(ButtonCustomModifier(radius: 8))
                
                Button(action : {}) {
                    VStack {
                        Image(systemName: "video.fill")
                        Text("Record").padding(.horizontal)
                    }
                }
                .padding()
                .modifier(ButtonCustomModifier(radius: .infinity))
                
//                Button(action: {}) {
//                    Image("yosemite")
//                        .renderingMode(.original)
//                        .cornerRadius(40)
//                }
                
                // Floating Button
                VStack{
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action : {}) {
                            Image(systemName: "plus").font(.title)
                        }
                        .padding(20)
                        .modifier(ButtonCustomModifier(radius: .infinity))
                    }
                }
                .padding(.trailing, 30) // clever usage of adopting Floating button.
            }
        }
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons()
    }
}
