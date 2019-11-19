//
//  BudgetsView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/18/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct BudgetsView: View {
    var body: some View {
        ZStack{
            Circle()
                .stroke(Color(red: 245/255, green: 245/255, blue: 245/255), lineWidth: 30)
            Circle()
                .trim(from: 0, to: 0.4)
                .stroke(Color.yellow, lineWidth: 30)
                .rotationEffect(.degrees(-90))
            Circle()
                .trim(from: 0.4, to: 0.7)
                .stroke(Color.orange.opacity(0.8), lineWidth: 30)
                .rotationEffect(.degrees(-90))
            Circle()
                .trim(from: 0.7, to: 0.9)
                .stroke(Color(red: 105/255, green: 205/255, blue: 255/255), lineWidth: 30)
                .rotationEffect(.degrees(-90))
            Circle()
                .trim(from: 0.9, to: 1.0)
                .stroke(Color.green.opacity(0.8), lineWidth: 30)
                .rotationEffect(.degrees(-90))
        }.overlay(VStack {
            Text("October").font(.system(size: 20, weight: .medium))
            Text("$3,000").font(.system(size: 28, weight: .bold))
        })
         .frame(height: 250)
    }
}
