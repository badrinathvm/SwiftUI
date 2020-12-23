//
//  BottomPieceView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 12/21/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

struct BottomPieceView: View {
    @State private var showFilter:Bool = false
    @State private var buttonName: [String] = ["By Amount", "Alphabetical", "Price", "Days"]
    var body: some View {
        VStack(spacing: 5) {
            Button(action : {
                withAnimation(Animation.easeInOut(duration: 0.2)) {
                    self.showFilter.toggle()
                }
            } ) {
                HStack {
                    Text(buttonName[0])
                        .padding(.horizontal, 5)
                    Image(systemName: "chevron.down.circle.fill")
                        .padding(.trailing, 5)
                }
                .padding(.horizontal, 5)
                .padding(.vertical, 5)
            }
            .modifier(ButtonCustomModifier(radius: 26))
            .padding(.trailing, 5)
           
            
            ForEach(buttonName.indices, id:\.self) { index in
                if index >= 1 {
                    HStack {
                        Button(action: {
                            //alter the array by swapping with index and the 0 the element.
                            withAnimation(Animation.easeInOut(duration: 0.2)) {
                                self.buttonName.swapAt(0, index)
                                self.showFilter.toggle()
                            }
                        }) {
                            HStack(alignment: .midAlignment) {
                                Text(buttonName[index])
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 5)
                                    .background(Capsule().foregroundColor(.purple))
                            }.id(index)
                            .padding(.vertical, 5)
                            .opacity(self.showFilter ? 1 : 0)
                            .foregroundColor(Color.white)
                            .animation(Animation.easeInOut(duration: 0.2).delay(0.2 * Double(index)))
                        }
                    }
                }
            }
        }
        .offset(x: UIScreen.main.bounds.size.width / 3)
        .padding(.trailing, 15)
    }
}

struct BottomPieceView_Previews: PreviewProvider {
    static var previews: some View {
        BottomPieceView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
                        .previewDisplayName("iPhone 11 Pro")
        
        BottomPieceView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
                        .previewDisplayName("iPhone 11")
        
        BottomPieceView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                        .previewDisplayName("iPhone 8")
    }
}
