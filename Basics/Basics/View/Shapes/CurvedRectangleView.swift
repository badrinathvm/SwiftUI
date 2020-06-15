//
//  CurvedRectangleView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 6/14/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

struct CurvedRectangleView: View {
    
    @State private var change = false
    var body: some View {
        VStack {
            CurvedRectangle(bottomOffset: change ? -50 : 0)
                .frame(height: 200)
                .foregroundColor(Color.blue)
                .shadow(radius: 8, x: 0, y: 10)
            
            Spacer()
            
            Image("y1")
                .resizable()
                .frame(height: 200)
                .aspectRatio(contentMode: .fit)
                .clipShape(CurvedRectangle(bottomOffset: 50))
                .shadow(radius: 8, x: 0, y: 10)
            
            Spacer()
            
            Wave(bottomOffset: change ? 30 : 0)
            .frame(height: 200)
            .foregroundColor(Color.blue)
            .shadow(radius: 8, x: 0, y: 10)
            
            Spacer()
            
            
            Image("y1")
                           .resizable()
                           .frame(height: 200)
                           .aspectRatio(contentMode: .fit)
                           .clipShape(Wave(bottomOffset: 50))
                           .shadow(radius: 8, x: 0, y: 10)
            
            Spacer()
        }.edgesIgnoringSafeArea(.top)
        .onAppear {
            withAnimation {
                self.change.toggle()
            }
        }
    }
}

struct CurvedRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        CurvedRectangleView()
    }
}
