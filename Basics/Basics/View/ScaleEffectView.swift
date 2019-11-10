//
//  ScaleEffectView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/10/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct ScaleEffectView: View {
    var body: some View {
        ScrollView(Axis.Set.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                Group {
                    Text("Before")
                    Text("Scale This").font(.title)
                    Divider()
                    Text("After (3x)")
                    Text("Scale This")
                        .font(.title).scaleEffect(3)
                    Divider()
                }
                Group {
                    Image("y1")
                        .resizable()
                        .frame(width: 200, height: 100)
                        .border(Color.pink)
                    Text("After 1.6x").padding().font(.body)
                    Image("y1")
                        .resizable()
                        .frame(width : 200, height: 100)
                        .scaleEffect(1.6)
                        .border(Color.pink)
                        .padding()
                    Text("Notice when scalling only the content that is getting affected not the frame").font(.body).layoutPriority(1)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.pink)
                        .foregroundColor(Color.white)
                }
                
                Group {
                    Text("Shrink Horizontally").font(.body)
                    Image("y1")
                        .resizable()
                        .frame(width : 200, height: 100)
                        .scaleEffect(x: 0.4, y: 1)
                    
                     Divider().padding(.top, 40)
                    
                    Text("Shrink Vertically").font(.body)
                    Image("y1")
                        .resizable()
                        .frame(width : 200, height: 100)
                        .scaleEffect(x: 1, y: 0.4)
                    
                     Divider().padding(.top, 40)
                    
                    Text("Shrink Horizontally , Stretch Vertically").font(.body)
                    Image("y1")
                        .resizable()
                        .frame(width : 200, height: 100)
                        .scaleEffect(x: 0.3, y: 2)
                        .padding(.top, 30)
                }
                
                Group {
                    Divider().padding(.top, 40)
                    Text("Flip Horizontally").font(.body)
                    Image("y1")
                    .resizable()
                    .frame(width : 200, height: 100)
                    .scaleEffect(x: -1, y: 1)
                    
                    Divider().padding(.top, 40)
                    Text("Flip Vertically").font(.body)
                    Image("y1")
                        .resizable()
                        .frame(width : 200, height: 100)
                        .scaleEffect(x: 1, y: -1)
                    
                    Divider().padding(.top, 40)
                    Text("Flip Vertically and Horizontally").font(.body)
                    Image("y1")
                        .resizable()
                        .frame(width : 200, height: 100)
                        .scaleEffect(x: -1, y: -1)
                }
                
                Group {
                    Divider().padding(.top , 40)
                    Text("Scaling happens front he center but can scale from different points in a view by using the anchor parameter")
                    .font(.body).layoutPriority(2)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.pink)
                    .foregroundColor(Color.white)
                    
                    Text("top Leading")
                        .scaleEffect(2.0, anchor: .topLeading)
                        .border(Color.pink)
                    
                    Divider().padding(.top , 40)
                    Text("top")
                        .scaleEffect(2.0, anchor: .top)
                        .border(Color.pink)
                    
                    Divider().padding(.top , 40)
                    Text("leading")
                        .scaleEffect(2.0, anchor: .leading)
                        .border(Color.pink)
                }
                
                Group {
                    Divider().padding(.top , 40)
                    Text("trailing")
                        .scaleEffect(2.0, anchor: .trailing)
                        .border(Color.pink)
                    
                    Divider().padding(.top , 40)
                    Text("bottom")
                        .scaleEffect(2.0, anchor: .bottom)
                        .border(Color.pink)
                    
                    Divider().padding(.top , 40)
                    Text("bottomTrailing")
                        .scaleEffect(2.0, anchor: .bottomTrailing)
                        .border(Color.pink)
                }
            }
        }
    }
}
