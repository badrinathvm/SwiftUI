//
//  TopBarTemplateView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 12/25/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

struct TopBarTemplateView: View {
    var title:String
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
                Text(title)
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

struct TopBarTemplateView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarTemplateView(title: "Top Bar")
    }
}
