//
//  BottomSheetTemplateView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 12/30/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

fileprivate enum Constants {
    static let radius: CGFloat = 16
    static let indicatorHeight: CGFloat = 6
    static let indicatorWidth: CGFloat = 60
    static let snapRatio: CGFloat = 0.25
    static let minHeightRatio: CGFloat = 0.3
}

struct BottomSheetTemplateView<Content:View>: View {
    @Binding var isOpen:Bool
    
    let maxHeight:CGFloat
    let minHeight: CGFloat
    let content:Content
    
    @GestureState private var transalation:CGFloat = 0
    
    init(isOpen: Binding<Bool>, maxHeight:CGFloat, @ViewBuilder content: () -> Content) {
        self._isOpen = isOpen
        self.maxHeight = maxHeight
        self.minHeight = maxHeight * Constants.minHeightRatio
        self.content = content()
    }
    
    private var offset: CGFloat {
        isOpen ? 0 : maxHeight - minHeight
    }
    
    private var indicator: some View {
        RoundedRectangle(cornerRadius: Constants.radius)
            .fill(Color.secondary)
            .frame(
                width: Constants.indicatorWidth,
                height: Constants.indicatorHeight
        )
    }
    
    var body: some View {
        GeometryReader { geometry in
                VStack(spacing: 0) {
                    self.indicator.padding()
                    self.content
                }
                .frame(width: geometry.size.width, height: self.maxHeight, alignment: .top)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(Constants.radius)
                .frame(height: geometry.size.height, alignment: .bottom)
                .offset(y: max(offset + self.transalation, 0))
                .animation(.interactiveSpring())
                .gesture( DragGesture().updating(self.$transalation) { (value, state, _) in
                    state = value.translation.height
                }.onEnded{ (value) in
                    let snapDistance = self.maxHeight * Constants.snapRatio
                    guard abs(value.translation.height) > snapDistance else {
                         print("Control")
                        return
                    }
                    self.isOpen = value.translation.height < 0
                })
            }
    }
}


struct BottomSheetTemplateView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetTemplateView(isOpen: Binding.constant(true), maxHeight: 400) {
            Rectangle().fill(Color.blue)
        }.edgesIgnoringSafeArea(.all)
    }
}

