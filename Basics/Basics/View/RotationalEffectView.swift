//
//  RotationalEffectView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/10/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct RotationalEffectView : View  {
    @State private var degrees = 25.0
    var body: some View  {
        ScrollView(Axis.Set.vertical, showsIndicators: false) {
            VStack {
                Group {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.yellow)
                        .frame(height: 200)
                        .overlay(Text("45° Back on X Axis").font(.body).bold())
                        .rotation3DEffect(Angle(degrees: 45), axis: (x: 1.0 ,y:0, z:0.0))
                }
                
                Group {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.yellow)
                        .frame(height: 200)
                        .overlay(Text("45° Forward on X Axis").font(.body).bold())
                        .rotation3DEffect(Angle(degrees: -45), axis: (x: 1.0 ,y:0, z:0.0))
                }
                
                Group {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.yellow)
                        .frame(height: 200)
                        .overlay(Text("Move Slider to adjust rotation").font(.body).bold())
                        .rotation3DEffect(Angle(degrees: degrees), axis: (x: 1.0 ,y:0, z:0.0))
                    
                    Slider(value: $degrees, in: -180...180, step: 1).padding()
                }
                
                Group {
                    Divider().padding()
                    RoundedRectangle(cornerRadius: 20.0)
                        .fill(Color.yellow)
                        .frame(height: 200)
                        .overlay(Text("45° back on Y axis").font(.body).bold())
                        .rotation3DEffect(Angle(degrees: 45), axis: (x: 0.0, y: 1.0, z: 0.0))
                    .padding()
                    
                    RoundedRectangle(cornerRadius: 20.0)
                        .fill(Color.yellow)
                        .frame(height: 200)
                        .overlay(Text("-45° Forward on Y axis").font(.body).bold())
                        .rotation3DEffect(Angle(degrees: -45), axis: (x: 0.0, y: 1.0, z: 0.0))
                    .padding()
                }
                
                Group {
                    Divider().padding()
                    RoundedRectangle(cornerRadius: 20.0)
                        .fill(Color.yellow).opacity(0.7)
                        .frame(height: 200)
                        .overlay(Text("25° on Z axis").font(.body).bold())
                        .rotation3DEffect(Angle(degrees: 25), axis: (x: 0.0, y: 0.0, z: 1.0))
                        .padding()
                    
                    RoundedRectangle(cornerRadius: 20.0)
                        .fill(Color.yellow).opacity(0.7)
                        .frame(height: 200)
                        .overlay(Text("-25° on Z axis").font(.body).bold())
                        .rotation3DEffect(Angle(degrees: -25), axis: (x: 0.0, y: 0.0, z: 1.0))
                        .padding()
                }
                
                Group {
                    Divider().padding()
                    RoundedRectangle(cornerRadius: 20.0)
                        .fill(Color.yellow).opacity(0.7)
                        .frame(height: 200)
                        .overlay(Text("\(degrees.rounded())° on X axis").font(.body).bold())
                        .rotation3DEffect(Angle(degrees: degrees), axis: (x: 1.0, y: 0.0, z: 0.0), anchor: .top)
                        .padding()
                    
                    RoundedRectangle(cornerRadius: 20.0)
                        .fill(Color.yellow).opacity(0.7)
                        .frame(height: 200)
                        .overlay(Text("\(degrees.rounded())° on Z axis").font(.body).bold())
                        .rotation3DEffect(Angle(degrees: -degrees), axis: (x: 0.0, y: 1.0, z: 0.0), anchor: .trailing)
                        .padding()
                    
                    RoundedRectangle(cornerRadius: 20.0)
                        .fill(Color.yellow).opacity(0.7)
                        .frame(height: 200)
                        .overlay(Text("\(degrees.rounded())° on Z axis").font(.body).bold())
                        .rotation3DEffect(Angle(degrees: degrees), axis: (x: 0.0, y: 0.0, z: 1.0), anchor: .topLeading)
                        .padding()
                }
                
                Group {
                    Divider().padding(.top, 40)
                    HStack {
                        Text("-90°").rotationEffect(Angle(degrees: -90))
                        Text("-45°").rotationEffect(Angle(degrees: -45))
                        Text("0°").rotationEffect(Angle(degrees: 0))
                        Text("45").rotationEffect(Angle(degrees: 45))
                        Text("90°").rotationEffect(Angle(degrees: 90))
                    }.font(.largeTitle)
                    .padding()
                }
                
                Group {
                    Divider().padding()
                    VStack(spacing: 20) {
                        Text(".topLeading")
                            .font(.body)
                            .rotationEffect(Angle(degrees: -35), anchor: .topLeading)
                            .border(Color.green)
                        
                        Text(".center")
                            .font(.body)
                            .rotationEffect(Angle(degrees: -35), anchor: .center)
                            .border(Color.green)
                        
                        Text(".bottomTrailing")
                        .font(.body)
                        .rotationEffect(Angle(degrees: -35), anchor: .bottomTrailing)
                        .border(Color.green)
                    }
                }
            }
        }
    }
}
