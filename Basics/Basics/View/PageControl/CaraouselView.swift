//
//  CaraouselView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 3/30/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

struct CaraouselView: View {
    @State var contentOffset: CGFloat = 0.0
    var body: some View {
        GeometryReader { proxy in
            VStack {
                ScrollView(Axis.Set.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(0..<5) { _ in
                            RoundedRectangle(cornerRadius: 8)
                                .frame(width: 311, height: 336)
                                .foregroundColor(Color.white)
                                .shadow(color: Color(UIColor.black).opacity(0.03), radius: 8, x: 5, y: -5)
                                .shadow(color: Color(UIColor.black).opacity(0.03), radius: 8, y: 5)
                                .border(Color.gray.opacity(0.03))
                                .background( Color.clear.preference(key: ScrollOffsetPreferenceKey.self, value: [proxy.frame(in: .global).minX - proxy.frame(in: .global).minX]))
                        }
                    }.padding(.horizontal,16).padding(.vertical, 10)
                }
                
                HStack(spacing: 8) {
                    ForEach(0..<5) { index in
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(Color.gray)
                    }
                }.padding()
            }
        }
    }
}

struct ScrollOffsetPreferenceKey: PreferenceKey {
    typealias Value = [CGFloat]
    
    static var defaultValue: [CGFloat] = [0]
    
    static func reduce(value: inout [CGFloat], nextValue: () -> [CGFloat]) {
        value.append(contentsOf: nextValue())
    }
}

