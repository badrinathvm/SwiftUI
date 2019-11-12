//
//  File.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/11/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct CombineEssentialsView: View {
    var tasks = ["Read Manual" /*,"Practiced in Simulator" , "Teacher Approved"*/]
    @State private var taskStatus = false
        
   //@Published var readManualStatus: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(tasks, id: \.self) { task in
                Toggle(isOn:self.$taskStatus ) {
                    Text(task)
                        .font(.system(size: 16, weight: Font.Weight.bold))
                }.padding(.horizontal, 10)
            }
        }
    }
}
