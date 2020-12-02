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

var lightGreen = UIColor(red: 213/255, green: 254/255, blue: 242/255, alpha: 1)
var lightGray = UIColor.lightGray

struct MainView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Current Budget")
                        .foregroundColor(Color(lightGray))
                        .font(Font.system(size: 20, weight: .bold))
                        .padding(.trailing, 20)
                    
                    Text("$500")
                        .foregroundColor(Color(lightGray))
                        .font(Font.system(size: 20, weight: .bold))
                        .multilineTextAlignment(.trailing)
                        .padding(.trailing, 20)
                        .padding(.top, 10)
                }
            }

            BarChartView()
                .padding(.top, 20)
        }
    }
}

struct BarChartView: View {
    var months = [
        MonthData(monthName: "JUL", height: 220, isDashed: false),
        MonthData(monthName: "AUG", height: 250, isDashed: false),
        //MonthData(monthName: "SEP", height: 210, isDashed: false),
        MonthData(monthName: "OCT", height: 210, isDashed: true)]
    
    var body: some View {
        ScrollView(Axis.Set.horizontal, showsIndicators: false) {
            HStack(alignment: .bottom, spacing: 15) {
                Spacer()
                ForEach(months, id: \.self) { monthData in
                         VStack {
                            if monthData.isDashed {
                                VStack(spacing: 30) {
                                    Text("$400")
                                        .foregroundColor(.black)
                                        .font(Font.system(size: 32, weight: Font.Weight.bold))
                                        .padding(.horizontal,10)
                                        .padding(.vertical, 20)
                                        .background(ToolTip(radius: 8).fill(Color.white)
                                                        .shadow(color: Color(UIColor.lightGray), radius: 8, x: 0, y: 5))
                                    Rectangle()
                                        .strokeBorder(Color.green, style: StrokeStyle(lineWidth: 1, dash: [8]))
                                        .frame(width: 80, height: monthData.height)
                                        .cornerRadius(8, corners: [.topLeft, .topRight])
                                        .background(Rectangle().foregroundColor(Color(lightGreen)))
                                }
                            } else {
                                Rectangle()
                                    .foregroundColor(Color(UIColor.lightGray))
                                    .frame(width: 80, height: monthData.height)
                                    .cornerRadius(8, corners: [.topLeft, .topRight])
                            }
                            
                            Text(monthData.monthName)
                                .foregroundColor(Color(lightGray))
                                .font(Font.system(size: 20, weight: .bold))
                        }
                    }
              Spacer()
          }
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

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
