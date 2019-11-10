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
            Button(action : {
                self.presentation.wrappedValue.dismiss()
            }) {
                Text("Dismiss")
            }.accentColor(Color.red)
        }
    }
}

struct SheetView: View {
    @State var isPresentingSheet = false
    let gradientColors = Gradient(colors: [.yellow, .orange])
    var body: some View  {
        Button(action: {
            self.isPresentingSheet = true
        }) {
            Text("Show Modal")
                .padding()
                .foregroundColor(Color.purple)
        }.background(Capsule().strokeBorder(LinearGradient(gradient: gradientColors, startPoint: .top, endPoint: .bottom), lineWidth: 2))
            .sheet(isPresented: $isPresentingSheet) {
                ModalView(title: "Sheet", subtitle: "Presenting Sheet")
        }
    }
}
