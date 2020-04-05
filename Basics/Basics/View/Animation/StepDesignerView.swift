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
    
    fileprivate func circles() -> some View {
        return ZStack {
            VStack {
                Circle()
                    .stroke(Color(red: 245/255, green: 245/255, blue: 245/255), lineWidth: 5)
                    .frame(width: 12, height:12)
                    .foregroundColor(Color.blue)
                    .overlay( Circle()
                        .frame(width: 10, height:10)
                        .foregroundColor(Color.green))
            }
        }
    }
    
    fileprivate func divider() -> some View {
        return HStack {
            Divider()
                .background(Color.gray)
                .frame(height: dividerHeight + 50)
                .padding()
        }
    }
    
    fileprivate func roundedRectangle(height: Int) -> some View {
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
                        .foregroundColor(Color.gray)
                        .padding(.vertical , 10)
                        .padding(.horizontal, 5)
                    Spacer()
                }
                Text("Home Loan")
                     .foregroundColor(Color.gray)
                     .padding(.vertical , 10)
                     .padding(.horizontal, 5)
            }
    }
    
    var cardHeights = [100, 50 , 100, 100, 100]
    var body: some View {
        GeometryReader { proxy in
            HStack {
                self.divider()
                VStack {
                    ForEach(0..<self.cardHeights.count, id:\.self) { index in
                        HStack(alignment: index % 2 == 0 ? .customTop : .customBottom) {
                            self.circles()
                                .padding(.horizontal, 10)
                                .alignmentGuide(index % 2 == 0 ? .customTop : .customBottom) { d in index % 2 == 0 ? d[VerticalAlignment.top] - 10 : d[VerticalAlignment.bottom] + 10  }
                            self.roundedRectangle(height: self.cardHeights[index])
                        }.onAppear {
                            print(proxy.frame(in: .global))
                                self.dividerHeight += CGFloat(self.cardHeights[index])
                                print(" Divider Height \(self.dividerHeight)")
                            }
                        .offset(x: -40)
                    }
                }
            }.padding()
        }
    }
}

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


//extension HorizontalAlignment {
//    private enum Mid:AlignmentID {
//        static func defaultValue(in context: ViewDimensions) -> CGFloat {
//            return context[HorizontalAlignment.center]
//        }
//    }
//
//    static let mid = HorizontalAlignment(Mid.self)
//}


//-------------------------------------------------------------------------------------------

//    var body: some View {
//        VStack {
//          ForEach(1..<6, id:\.self) { index in
//            StepCardView(height: 80)
//           }
//        }
//    }
    
//struct StepperView: View {
//    var height: Int
//    var body: some View  {
//        VStack(alignment: .center) {
//            ZStack{
//                Circle()
//                    .frame(width: 12, height:12)
//                    .foregroundColor(Color.blue)
//                Circle()
//                    .frame(width: 10, height:10)
//                    .foregroundColor(Color.green)
//            }
//            HStack {
//                Divider().background(Color.gray)
//                    //.frame(height: CGFloat(height))
//                    //.offset(y: -5)
//                .padding()
//            }
//        }
//    }
//}


//------------------------------------------------------
//struct StepCardView: View {
//    var height:Int
//    var body: some View {
//        HStack(alignment: .midCard) {
//            VStack {
//                StepperView(height: height)
//                    .alignmentGuide(.midCard) { d in d[.center] }
//            }
//            VStack {
//                RoundedRectangle(cornerRadius: 8)
//                    .frame(width: 350, height: 100)
//                    .foregroundColor(Color.white)
//                    .shadow(color: Color(UIColor.black).opacity(0.03), radius: 8, x: 5, y: -5)
//                    .shadow(color: Color(UIColor.black).opacity(0.03), radius: 8, y: 5)
//                    .border(Color.gray)
//            }
//        }
//    }
//}


//    func temp() -> some View {
//        return  ZStack {
//            VStack {
//                ForEach(0..<5) { _ in
//                    HStack(alignment: .midCard) {
//                        self.circles()
//                        .alignmentGuide(.midCard) { d in d[VerticalAlignment.bottom] / 2 }
//                    }
//                }
//            }.zIndex(1)
//            divider()
//        }
//    }
    

//        return RoundedRectangle(cornerRadius: 8)
//            .frame(width: 300, height: CGFloat(height))
//            .foregroundColor(Color.white)
//            .shadow(color: Color(UIColor.black).opacity(0.03), radius: 8, x: 5, y: -5)
//            .shadow(color: Color(UIColor.black).opacity(0.03), radius: 8, y: 5)
//            .border(Color.gray)
//            .overlay(roundText())
