//
//  BarChartView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 12/2/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

struct MonthData: Hashable {
    var monthName:String
    var height:CGFloat
    var isDashed:Bool
}

struct AnchorData: Equatable {
    var position: CGFloat = 0.0
    init(position: CGFloat) {
        self.position = position
    }
}

//Constants for Colors
var lightGreen = UIColor(red: 213/255, green: 254/255, blue: 242/255, alpha: 1)
var lightGray = UIColor(red: 0.70, green: 0.70, blue: 0.70, alpha: 1.00)
var pink03 = UIColor(red: 0.97, green: 0.47, blue: 0.65, alpha: 1.00)
let radius: CGFloat = 8.0
var barWidth:CGFloat = 60
//TODO:: Below values we will get from service.
var budgetTarget:CGFloat = 230

struct MainView: View {
    @State private var tipPosition: CGFloat  = 0.0
    var body: some View {
        VStack {
            ToolTipView(text: "$400", tipPosition: $tipPosition)
            BarChartView()
                .padding(.top, 20)
        }
        .onPreferenceChange(AnchorPreferenceKey.self) { anchorPosition in
            //log("Anchor Position \(anchorPosition)")
            self.tipPosition = anchorPosition!
        }
    }
}

struct ToolTipView: View {
    var text:String
    @Binding var tipPosition:CGFloat
    var body: some View  {
        VStack {
            Text(text)
                .foregroundColor(.black)
                .font(Font.system(size: 16, weight: Font.Weight.bold))
                .padding(.horizontal,15)
                .padding(.vertical, 15)
                .background(ToolTip(radius: 8)
                                .fill(Color.white)
                                .shadow(color: Color(UIColor.lightGray), radius: 8, x: 0, y: 0))
                .offset(x: self.tipPosition, y: 30)
        }
    }
}

struct BarChartView: View {
    @State private var budgetPosition:CGFloat = 0
    @State private var heightOfText:CGFloat = 0
    var months = [ MonthData(monthName: "JUL", height: 220, isDashed: false),
        MonthData(monthName: "AUG", height: 250, isDashed: false),
        MonthData(monthName: "SEP", height: 210, isDashed: false),
        MonthData(monthName: "OCT", height: 210, isDashed: true)]

    var body: some View {
        VStack {
            ScrollView(Axis.Set.horizontal, showsIndicators: false) {
                HStack(alignment: .bottom, spacing: 12) {
                    ForEach(months, id: \.self) { monthData in
                             VStack {
                                if monthData.isDashed {
                                    dottedRectangle(monthData: monthData)
                                } else {
                                    normalRectangle(monthData: monthData)
                                }
                            }
                        }
                }.padding(.horizontal, 15)
            }
            .heightPreference()
            .onPreferenceChange(VerticalHeightPreference.self) {
                //log("Budget Position \($0.values.first!)")
                budgetPosition = $0.values.first!
            }
            
            Divider()
                .background(Color(lightGray))
                .offset(y: -(budgetTarget + 8))
            
            HStack {
                ForEach(months, id: \.self) { monthData in
                    Text(monthData.monthName)
                        .foregroundColor(Color(lightGray))
                        .font(Font.system(size: 20, weight: .bold))
                        .multilineTextAlignment(.center)
                        .frame(width:barWidth)
                        //.border(Color.black)
                }
                Spacer()
            }.padding(.horizontal, 20)
            //textStack()
        }
    }
}

extension BarChartView {
    fileprivate func dottedRectangle(monthData: MonthData) -> some View {
        return VStack {
            Rectangle()
                .strokeBorder(Color.green, style: StrokeStyle(lineWidth: 1, dash: [8]))
                .frame(width: barWidth, height: monthData.height)
                .cornerRadius(radius, corners: [.topLeft, .topRight])
                .background(Rectangle().foregroundColor(Color(lightGreen)))
                //passing position data to parent view to anchor the Tool tip using preferences and anchors.
//                .background(GeometryReader { proxy in
//                    Color.clear.preference(key: AnchorPreferenceKey.self, value: proxy.frame(in: .global).origin.x)
//                })
                .anchorPreference(key: BoundsPreferenceKey.self, value: .bounds) { $0 }
                .overlayPreferenceValue(BoundsPreferenceKey.self) { preferences in
                    GeometryReader { reader in
                        preferences.map { anchor in
                            Color.clear.preference(key: AnchorPreferenceKey.self, value: reader[anchor].midX + barWidth / 2)
                        }
                    }
                }
        }
    }
    
    fileprivate func normalRectangle(monthData: MonthData) -> some View  {
        return VStack {
            log("\(abs(budgetPosition - budgetTarget))")
            Rectangle()
                .foregroundColor(Color(UIColor.lightGray))
                .frame(width: barWidth, height: monthData.height)
                .cornerRadius(radius, corners: [.topLeft, .topRight])
                // draw an overlay for smaller rectangle (pink one)
                .anchorPreference(key: BoundsPreferenceKey.self, value: .bounds) { $0 }
                .overlayPreferenceValue(BoundsPreferenceKey.self) { preferences in
                    GeometryReader { reader in
                        if monthData.height > budgetTarget {
                            Rectangle()
                                .foregroundColor(Color(pink03))
                                .cornerRadius(radius, corners: [.topLeft, .topRight])
                                .frame(width: barWidth, height:  abs(monthData.height - budgetTarget))
                        } else {
                            EmptyView().eraseToAnyView()
                        }
                    }
                }
        }
    }
    
    fileprivate func textStack() -> some View {
        return HStack {
            Spacer()
            VStack(alignment: .trailing) {
                Text("Current Budget")
                Text("$500")
                    .padding(.top, 10)
            }
            .padding(.trailing, 20)
            .foregroundColor(Color(lightGray))
            .font(Font.system(size: 20, weight: .bold))
        }
    }
}


struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

// -- Extensions for View with helper functions.
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
    
    /// Stores the height for each of column which will be passed as part of onPreferenceChange to parent view.
    func heightPreference(column: Int? = 0) -> some View {
        background(GeometryReader { proxy in
            Color.clear.preference(key: VerticalHeightPreference.self, value: [column!: proxy.size.height])
        })
    }
}

// ---- PreferenceKey struts for calculatin the height and anchor data.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
struct VerticalHeightPreference: PreferenceKey {
    typealias Value = [Int:CGFloat]
    /// provide a default value for custom dependency
    static let defaultValue: Value = [:]
    
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value.merge(nextValue(), uniquingKeysWith: max)
    }
}


struct AnchorPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat?

    static func reduce(value: inout CGFloat?, nextValue: () -> CGFloat?) {
        value = value ?? nextValue()
    }
}

// Preview

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
                            .previewDisplayName("iPhone 11")
        }
    }
}








