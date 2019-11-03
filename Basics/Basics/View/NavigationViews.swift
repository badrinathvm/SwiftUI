//
//  NavigationViews.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/2/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

//Key Notes : Navigation view should be present inside VStack.

struct DetailView: View {
    // environment variable to access presentationMode property ( useful for dismissing the view )
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            Text("Detail View")
          }
            .navigationBarBackButtonHidden(true) // hide the system button
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }){
                HStack{
                    Image(systemName: "arrow.left.circle")
                    Text("Go Back")
                }
            })
        }
    }

struct NavigationViews: View {
    @State private var isHidden = false
    var body: some View {
        NavigationView {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.bottom)
                VStack {
                    NavigationLink("Go To Detail", destination: DetailView())
                    Toggle("Hide Navigation Bar" , isOn: $isHidden).padding()
                }
                .navigationBarTitle(Text("Navigation"))
                .navigationBarItems(
                    leading:
                    Button(action: {}) {
                        Text("Actions").font(.body).accentColor(Color.pink)
                    },
                    trailing: Button(action : {}) {
                        Image(systemName: "bell.fill").accentColor(Color.pink)
                })
                .navigationBarHidden(isHidden)
            }
        }
    }
}

