//
//  StepDesignerView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 4/2/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

enum StepperAlignment: String, CaseIterable {
    case top = "Top", center = "Center", bottom = "Bottom"
}

struct StepDesignerView: View {
    let cells = [StepperContentView(alignment: .top), StepperContentView(alignment: .center), StepperContentView(alignment: .bottom),StepperContentView(alignment: .top), StepperContentView(alignment: .center), StepperContentView(alignment: .bottom)]
    
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                ScrollView(Axis.Set.vertical, showsIndicators: false) {
                    StepperView(cells: self.cells)
                }
            }
            .navigationBarTitle("Stepper View1")
        }
    }
}

//MARK:- Circle View for Stepper Indicator
struct CircleView: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(red: 245/255, green: 245/255, blue: 245/255), lineWidth: 5)
                .frame(width: 12, height:12)
                .overlay(Circle()
                        .frame(width: 10, height:10)
                        .foregroundColor(Color.green))
        }
    }
}

//MARK:- Line View for Stepper
struct LineView: View {
    @Binding var dividerHeight:CGFloat
    var body:some View {
        return Divider()
            .background(Color.gray)
            .frame(height: dividerHeight)
            .padding()
    }
}

//MARK:- Stepper View Implementation
struct StepperView: View  {
    @State var dividerHeight:CGFloat = 0
    @State private var columnHeights: [Int: CGFloat] = [:]
    var cells:[StepperContentView]
    var body: some View {
        HStack {
            //line view to host circle to point
            LineView(dividerHeight: $dividerHeight)
            VStack(spacing: 30) {
                ForEach(0..<self.cells.count, id:\.self) { index in
                    HStack(alignment: self.getAlignment(type: self.cells[index].alignment)) {
                            CircleView()
                                .padding(.horizontal, 10.0)
                                .setAlignment(type: self.cells[index].alignment)
                        self.cells[index]
                            .heightPreference(column: index)
                    }
                    .offset(x: -40)
                }
            }.onPreferenceChange(HeightPreference.self) {
                self.columnHeights = $0
                print(self.columnHeights)
                //get heights of each of the cell + paddings
                self.dividerHeight = Array(self.columnHeights.values).reduce(0, +) + CGFloat(24 * self.cells.count)
                print("Divider Height \(self.dividerHeight)")
            }
        }.padding()
    }
}

//MARK:- Stepper Content View
struct StepperContentView: View  {
    var alignment: StepperAlignment
    var body: some View {
        return roundedRectangle()
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
                  ForEach([StepperAlignment.top.rawValue, StepperAlignment.center.rawValue, StepperAlignment.bottom.rawValue], id:\.self) { value in
                      self.textContent(text: value)
                  }
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
    
    /// returns the alignment guide based on the alignemnt type.
    /// - Parameter type: <#type description#>
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

//MARK:- Collects width of all the cells, with reduce takes the maximum value for the given key
struct HeightPreference: PreferenceKey {
    typealias Value = [Int:CGFloat]
    static let defaultValue: Value = [:]
    
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value.merge(nextValue(), uniquingKeysWith: max)
    }
}
