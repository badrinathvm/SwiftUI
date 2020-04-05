//
//  StepDesignerView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 4/2/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

struct StepDesignerView: View {
    @State private var dividerHeight:CGFloat = 0.0
    @State private var columnHeights: [Int: CGFloat] = [:]
    
    fileprivate func circles() -> some View {
        return ZStack {
            Circle()
                .stroke(Color(red: 245/255, green: 245/255, blue: 245/255), lineWidth: 5)
                .frame(width: 12, height:12)
                .overlay(Circle()
                        .frame(width: 10, height:10)
                        .foregroundColor(Color.green))
        }
    }
    
    fileprivate func divider() -> some View {
        return HStack {
            Divider()
                .background(Color.gray)
                .frame(height: dividerHeight)
                .padding()
        }
    }
    
    fileprivate func roundedRectangle() -> some View {
        return rectangleContent()
        .overlay(RoundedRectangle(cornerRadius: 8)
                    .frame(width: 300)
                    .foregroundColor(Color.clear)
                    .shadow(color: Color(UIColor.black).opacity(0.03), radius: 8, x: 5, y: -5)
                    .shadow(color: Color(UIColor.black).opacity(0.03), radius: 8, y: 5)
                    .border(Color.gray))
    }
    
    fileprivate func rectangleContent() -> some View  {
        return
            VStack(alignment: .leading) {
                HStack {
                    Text("Refinance Reason")
                        .padding(.vertical , 10)
                        .padding(.horizontal, 5)
                    Spacer()
                }
                Text("Home Loan")
                    .padding(.vertical , 10)
                    .padding(.horizontal, 5)
                   
                Text("Home Loan1")
                    .padding(.vertical , 10)
                    .padding(.horizontal, 5)
            }
            .foregroundColor(Color.gray)
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                ScrollView(Axis.Set.vertical, showsIndicators: false) {
                    HStack {
                        self.divider()
                        VStack(spacing: 30) {
                            ForEach(0..<6, id:\.self) { index in
                                HStack(alignment: index % 2 == 0 ? .customTop : .customBottom) {
                                    self.circles()
                                        .padding(.horizontal, 10)
                                        .alignmentGuide(index % 2 == 0 ? .customTop : .customBottom) { d in index % 2 == 0 ? d[VerticalAlignment.top] - 15 : d[VerticalAlignment.bottom] + 15  }
                                    self.roundedRectangle()
                                        .heightPreference(column: index)
                                }
                                .offset(x: -40)
                            }
                        }.onPreferenceChange(HeightPreference.self) {
                            self.columnHeights = $0
                            print(self.columnHeights)
                            //get heights of each of the cell + paddings
                            self.dividerHeight = Array(self.columnHeights.values).reduce(0, +) + (30 * 5)
                            print(" Divider Height \(self.dividerHeight)")
                        }
                    }.padding()
                }
            }
            .navigationBarTitle("Stepper View")
        }
    }
}

//MARK:- Custom alignments
extension VerticalAlignment {
    private enum CustomTopAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context[.top]
        }
    }
    
    private enum CustomBottomAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context[.bottom]
        }
    }
    
    static let customTop = VerticalAlignment(CustomTopAlignment.self)
    
    static let customBottom = VerticalAlignment(CustomBottomAlignment.self)
}

//MARK:- To Calculate the height
extension View {
    // Stores the width for each of the column which will be passed as part of onPreference change on the view.
    func heightPreference(column: Int) -> some View {
        background(GeometryReader { proxy in
            Color.clear.preference(key: HeightPreference.self, value: [column: proxy.size.height])
        })
    }
}

//MARK:- Collects width of all the cells, with reduce takes the maximum value for the given key
struct HeightPreference: PreferenceKey {
    typealias Value = [Int:CGFloat]
    static let defaultValue: Value = [:]
    
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value.merge(nextValue(), uniquingKeysWith: max)
    }
}
