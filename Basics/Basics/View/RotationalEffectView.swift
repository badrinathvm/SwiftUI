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
                        .overlay(Text("45 degree Back on X Axis").font(.body).bold())
                        .rotation3DEffect(Angle(degrees: 45), axis: (x: 1.0 ,y:0, z:0.0))
                }
                
                Group {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.yellow)
                        .frame(height: 200)
                        .overlay(Text("45 degree Forward on X Axis").font(.body).bold())
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
                        .overlay(Text("45 degree back on Y axis").font(.body).bold())
                        .rotation3DEffect(Angle(degrees: 45), axis: (x: 0.0, y: 1.0, z: 0.0))
                    .padding()
                    
                    RoundedRectangle(cornerRadius: 20.0)
                        .fill(Color.yellow)
                        .frame(height: 200)
                        .overlay(Text("-45 degree Forward on Y axis").font(.body).bold())
                        .rotation3DEffect(Angle(degrees: -45), axis: (x: 0.0, y: 1.0, z: 0.0))
                    .padding()
                }
                
                Group {
                    Divider().padding()
                    RoundedRectangle(cornerRadius: 20.0)
                        .fill(Color.yellow).opacity(0.7)
                        .frame(height: 200)
                        .overlay(Text("25 degress on Z axis").font(.body).bold())
                        .rotation3DEffect(Angle(degrees: 25), axis: (x: 0.0, y: 0.0, z: 1.0))
                        .padding()
                    
                    RoundedRectangle(cornerRadius: 20.0)
                        .fill(Color.yellow).opacity(0.7)
                        .frame(height: 200)
                        .overlay(Text("-25 degree on Z axis").font(.body).bold())
                        .rotation3DEffect(Angle(degrees: -25), axis: (x: 0.0, y: 0.0, z: 1.0))
                        .padding()
                }
                
                Group {
                    Divider().padding()
                    RoundedRectangle(cornerRadius: 20.0)
                        .fill(Color.yellow).opacity(0.7)
                        .frame(height: 200)
                        .overlay(Text("\(degrees.rounded()) degress on X axis").font(.body).bold())
                        .rotation3DEffect(Angle(degrees: degrees), axis: (x: 1.0, y: 0.0, z: 0.0), anchor: .top)
                        .padding()
                    
                    RoundedRectangle(cornerRadius: 20.0)
                        .fill(Color.yellow).opacity(0.7)
                        .frame(height: 200)
                        .overlay(Text("\(degrees.rounded()) degree on Z axis").font(.body).bold())
                        .rotation3DEffect(Angle(degrees: -degrees), axis: (x: 0.0, y: 1.0, z: 0.0), anchor: .trailing)
                        .padding()
                    
                    RoundedRectangle(cornerRadius: 20.0)
                        .fill(Color.yellow).opacity(0.7)
                        .frame(height: 200)
                        .overlay(Text("\(degrees.rounded()) degree on Z axis").font(.body).bold())
                        .rotation3DEffect(Angle(degrees: degrees), axis: (x: 0.0, y: 0.0, z: 1.0), anchor: .topLeading)
                        .padding()
                }
            }
        }
    }
}
