//
//  StepDesignerView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 4/2/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

enum StepperAlignment: String, CaseIterable {
    case top, center, bottom
}

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
        return
            Divider()
                .background(Color.gray)
                .frame(height: dividerHeight)
                .padding()
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
    
    fileprivate func textContent(text: String) -> some View {
        return HStack {
                Text(text)
                .padding(.vertical , 10)
                .padding(.horizontal, 5)
                .foregroundColor(Color.gray)
            Spacer()
        }
    }
    
    fileprivate func rectangleContent() -> some View  {
        return
            VStack(alignment: .leading) {
                ForEach(["Top Text", "Middle Text", "Bottom Text"], id:\.self) { value in
                    self.textContent(text: value)
                }
            }
    }
    

    var cells = [StepperAlignment.top, StepperAlignment.center, StepperAlignment.bottom, StepperAlignment.top, StepperAlignment.center, StepperAlignment.bottom]
    
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                ScrollView(Axis.Set.vertical, showsIndicators: false) {
                    HStack {
                        self.divider()
                        VStack(spacing: 30) {
                            ForEach(0..<self.cells.count, id:\.self) { index in
                                HStack(alignment: self.getAlignment(type: self.cells[index])) {
                                    self.circles()
                                        .padding(.horizontal, 10)
                                        //.alignmentGuide(index % 2 == 0 ? .customTop : .customBottom) { d in index % 2 == 0 ? d[VerticalAlignment.top] - 15 : d[VerticalAlignment.bottom] + 15  }
                                        .setAlignment(type: self.cells[index])
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
                            print("Divider Height \(self.dividerHeight)")
                        }
                    }.padding()
                }
            }
            .navigationBarTitle("Stepper View")
        }
    }
    
    func getAlignment(type: StepperAlignment) -> VerticalAlignment{
        switch type {
        case .top:
            return .customTop
        case .center:
             return .customCenter
        case .bottom:
            return .customBottom
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
    
    private enum CustomCenterAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context[VerticalAlignment.center]
        }
    }
    
    static let customTop = VerticalAlignment(CustomTopAlignment.self)
    
    static let customBottom = VerticalAlignment(CustomBottomAlignment.self)
    
    static let customCenter = VerticalAlignment(CustomCenterAlignment.self)
}

//MARK:- To Calculate the height
extension View {
    // Stores the width for each of the column which will be passed as part of onPreference change on the view.
    func heightPreference(column: Int) -> some View {
        background(GeometryReader { proxy in
            Color.clear.preference(key: HeightPreference.self, value: [column: proxy.size.height])
        })
    }
    
    func setAlignment(type: StepperAlignment)-> some View  {
          switch type {
          case .top:
            return self.alignmentGuide(.customTop) { d in d[VerticalAlignment.top] - 15 }
          case .center:
            return self.alignmentGuide(.customCenter) { d in d[VerticalAlignment.center] }
          case .bottom:
            return self.alignmentGuide(.customBottom) { d in d[VerticalAlignment.bottom] + 15 }
          }
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
