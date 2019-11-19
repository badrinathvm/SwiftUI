//
//  SheetView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/9/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct ModalView: View {
    @Environment(\.presentationMode) var presentation
    var title:String
    var subtitle: String
    var body: some View {
        VStack(spacing: 20) {
            Text(title).font(.title)
            Text(subtitle).font(.body)
            Text("By changing the State variable, you can trigger the sheet to show")
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(Color.white)
                .background(Color.red)
            Spacer()
            
            VStack{
                Image(systemName: "arrow.up")
                Text("Expand Infinite Vertically").padding()
                Image(systemName: "arrow.down")
            }.frame(minHeight: 0 , maxHeight: .infinity)
                .background(Color.pink)
                .foregroundColor(Color.white)
            
            Button(action : {
                self.presentation.wrappedValue.dismiss()
            }) {
                Text("Dismiss")
            }.accentColor(Color.red)
            
        }.padding(.top, 40)
    }
}

struct SheetView: View {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @State var isPresentingSheet = false
    let gradientColors = Gradient(colors: [.yellow, .orange])
    var body: some View  {
        VStack(spacing: 20){
            Text("Modal Sheets").padding(.top, horizontalSizeClass == UserInterfaceSizeClass.compact ? 60 : 20)
                .padding() // extra padding again to fit properly
                .frame(maxWidth : .infinity)
                .font(.title)
                .foregroundColor(Color.white)
                .background(Color.orange)
            Button(action: {
                self.isPresentingSheet = true
            }) {
                Text("Show Modal")
                    .padding()
                    .foregroundColor(Color.purple)
            }
            .background(Capsule().strokeBorder(LinearGradient(gradient: gradientColors, startPoint: .top, endPoint: .bottom), lineWidth: 2))
            .sheet(isPresented: $isPresentingSheet) {
                    ModalView(title: "Sheet", subtitle: "Presenting Sheet")
            }
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
    }
}
