//
//  PieChartView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 12/14/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

struct PieChartView: View {
    var body: some View {
        VStack{
            ZStack {
                HStack {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color.black)
                    }
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {}) {
                        Image(systemName: "bell.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.black)
                    }
                }
                Text("My Usage")
                    .foregroundColor(Color.black)
            }
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .padding()
            .overlay(Rectangle()
                        .stroke(Color.black.opacity(0.05),lineWidth: 2))
            
            Spacer()
        }.edgesIgnoringSafeArea(.all)
    }
}

struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView()
    }
}
