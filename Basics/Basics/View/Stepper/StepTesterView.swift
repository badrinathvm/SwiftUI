//
//  StepTesterView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 4/7/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI
import StepperView

struct StepTesterView: View {

    let alignments = [StepperAlignment.top,StepperAlignment.center,StepperAlignment.bottom]

    let indicatorTypes = [StepperIndicationType<AnyView>.image(Image(systemName: "arrow.right.circle"), 20),
                            StepperIndicationType<AnyView>.image(Image(systemName: "arrow.uturn.right"),20)]
    
    var body: some View {
          StepperView(cells: [cellBody , cellBody], alignments: alignments,indicationType:indicatorTypes, verticalSpacing: 30.0)
    }
    
    var cellBody:some View {
        VStack(alignment: .leading) {
            ForEach(["Top","Center","Bottom"], id:\.self) { value in
                HStack {
                    Text(value)
                        .foregroundColor(Color.gray)
                        .padding(.vertical , 10)
                        .padding(.horizontal, 5)
                    Spacer()
                }
            }
        }
    }
}






