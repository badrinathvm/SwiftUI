//
//  ShadowView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/10/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct ShadowView: View {
    var body: some View {
        ScrollView(Axis.Set.vertical, showsIndicators: false) {
            VStack {
                Group {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.blue)
                        .frame(width: 300, height: 75)
                        .overlay(Text("Color: Purple"))
                    Circle()
                        .fill(Color.blue)
                        .frame(height: 200)
                        .overlay(Text("On Shapes"))
                        .padding()
                    
                    Image(systemName: "paintbrush.fill")
                        .font(.system(size: 50))
                        .foregroundColor(Color.blue)
                }.shadow(color: Color.primary,radius: 10) // primary Handles dark and light mode effectively
                
                Group {
                    Text("Use X and Y parameters to chnage the location of the shadow")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                    
                    Circle()
                        .fill(Color.blue)
                        .shadow(radius: 1, x: 8, y: -8)
                        .frame(height: 100)
                        .overlay(Text("X:8 , Y:-8"))
                    
                    Circle()
                        .fill(Color.blue)
                        .shadow(radius: 1, x: 8, y: 8)
                        .frame(height: 100)
                        .overlay(Text("X:8 , Y:8"))
                    
                    Circle()
                        .fill(Color.blue)
                        .shadow(radius: 1, x: -8, y: 8)
                        .frame(height: 100)
                        .overlay(Text("X:-8 , Y:8"))
                        .padding()
                    
                    Circle()
                        .fill(Color.blue)
                        .shadow(radius: 1, x: -8, y: -8)
                        .frame(height: 100)
                        .overlay(Text("X:-8 , Y:-8"))
                }
                
                Group {
                    Button(action:  {}) {
                        Text("Just Outside")
                            .padding()
                            .background(Capsule()
                                .stroke(Color.blue, lineWidth: 2)
                                .shadow(color: .black, radius: 5))
                    }
                    
                    Spacer()
                    
                    Button(action:  {}) {
                        Text("Just Outside")
                            .padding()
                            .background(Capsule()
                                .fill(Color.white)
                                .shadow(color: .black, radius: 5))
                    }
                    .overlay(Capsule().stroke(Color.blue, lineWidth: 2))
                    
                    Spacer()
                    
                    Button(action: {} ) {
                        Text("Just Outside")
                    }.padding()
                        .background(Color.white)
                        .cornerRadius(.infinity)
                        .shadow(color: Color.black, radius: 5)
                        .overlay(Capsule().stroke(Color.blue, lineWidth: 2))
                }
            }
        }
    }
}
