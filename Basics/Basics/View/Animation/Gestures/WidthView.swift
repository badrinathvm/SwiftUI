//
//  WidthView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 3/23/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

struct BoundsPreferenceKey: PreferenceKey {
    typealias Value = Anchor<CGRect>?
    
    static var defaultValue: Value = nil
    
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = nextValue()
    }
}

//struct WidthView: View {
//    var body: some View {
//        ZStack {
//            Text("Balance Transfer")
//                .font(.system(size: 11, weight: Font.Weight.medium))
//                .anchorPreference(key: BoundsPreferenceKey.self, value: .bounds) { $0 }
//        }
//        .overlayPreferenceValue(BoundsPreferenceKey.self) { preferences in
//            GeometryReader { geometry in
//                preferences.map {
//                    RoundedRectangle(cornerRadius: CGFloat(8))
//                        .frame(width: geometry[$0].width, height: geometry[$0].width)
//                        .foregroundColor(Color.white)
//                        .shadow(color: Color(UIColor.black).opacity(0.03), radius: CGFloat(8), x: 5, y: -5) // this will add shadow towards right top side.
//                        .padding(.vertical, 8)
//                        .shadow(color: Color(UIColor.black).opacity(0.03), radius: CGFloat(8), y: 5) // this will add shadow towrads right bottom side
//                }
//            }
//        }
//    }
//}

struct FilterBodyView: View {
    var name:String
    var body: some View {
        VStack {
            filterImage
            filterName
        }
    }
    
    private var filterImage: some View  {
        return Image("y1")
            .resizable()
            .frame(width: 50,height: 50)
            .padding(.horizontal, 24)
            .padding(.top, 12)
            .aspectRatio(contentMode: ContentMode.fit)
    }
    
    private var filterName : some View  {
        return Text(name)
            .foregroundColor(Color.gray)
            .multilineTextAlignment(TextAlignment.center)
            .font(.system(size: 11, weight: Font.Weight.medium))
            .padding(.bottom , 16)
            .padding(.horizontal, 2)
    }
}

struct WidthPreference: PreferenceKey {
    static let defaultValue: [Int:CGFloat] = [:]
    static func reduce(value: inout Value, nextValue: () -> Value) {
        print(value)
        value.merge(nextValue(), uniquingKeysWith: max)
        print(value.sorted(by:<))
    }
}

extension View {
    func widthPreference(column: Int) -> some View {
        background(GeometryReader { proxy in
            Color.clear.preference(key: WidthPreference.self, value: [column: proxy.size.width])
        })
    }
}

struct WidthView: View {
    var cells = [FilterBodyView(name: "Balance Transfer"),FilterBodyView(name: "one"),FilterBodyView(name: "Two"),FilterBodyView(name: "Four"), FilterBodyView(name: "Three") ]
    var body: some View {
        CarouselView(cells: cells)
    }
}

struct CarouselView<Cell:View>: View {
    var cells:[Cell]
    @State private var columnWidths: [Int: CGFloat] = [:]
    var body: some View {
      ScrollView(Axis.Set.horizontal, showsIndicators: false) {
        HStack(spacing: 8) {
            ForEach(self.cells.indices) { column in
                    self.cells[column]
                        //.widthPreference(column: column)
                        .padding(8)
                        .background(RoundedRectangle(cornerRadius: 8)
                            .frame(width: self.columnWidths[column], height: self.columnWidths[column])
                            .foregroundColor(Color.white)
                            .shadow(color: Color(UIColor.black).opacity(0.03), radius: CGFloat(8), x: 5, y: -5)
                            .padding(.vertical, 8)
                            .shadow(color: Color(UIColor.black).opacity(0.03), radius: CGFloat(8), y: 5))
                }
         }.padding(.horizontal, 16)
        .onPreferenceChange(WidthPreference.self) { self.columnWidths = $0 }
     }
    }
}
