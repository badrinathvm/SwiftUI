//
//  sheetViewIdentifiable.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/9/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct DetailInfo: Identifiable {
    var id = UUID()
    let image: Image
}

struct SheetViewIDentifiable: View {
    @State var detailInfo:DetailInfo = nil
    var body: some View {
        VStack {
            Button(action : {
                self.detailInfo = DetailInfo(image: Image(systemName: "star.circle"))
            }) {
                Text("Show Sheet")
                .padding()
                    .foregroundColor(Color.pink)
            }.background(Capsule().strokeBorder(Color.purple, lineWidth: 2))
                .sheet(item: $detailInfo) { (detailInfo)  in
                    DetailSheetView(details: detailInfo)
            }
        }
    }
}

struct DetailSheetView: View {
    @Environment(\.presentationMode) var presentation
    var details: DetailInfo
    var body: some View {
        VStack(spacing: 20) {
            details.image.font(.largeTitle).foregroundColor(Color.purple)
            Text("Sheet").font(.largeTitle)
            Text("Presenting with Identifiable")
            Spacer()
            Button(action: {
                self.presentation.wrappedValue.dismiss()
            }) {
                Text("Dismiss")
            }.accentColor(Color.purple)
        }.padding(.top, 40)
    }
}
