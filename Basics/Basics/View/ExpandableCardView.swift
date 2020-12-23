//
//  ExpandableCardView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 12/22/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
struct ExpandableCardView: View {
    @State private var isExpand:Bool = false
    @State private var opacity: Double = 0
    var body: some View {
        VStack(spacing: 0) {
            // top rectangle View
                Rectangle()
                    .frame(width: 350, height: 50)
                    .foregroundColor(Colors.green02)
                    .cornerRadius(18.0, corners: [.topLeft, .topRight])
                    .overlay(
                        HStack {
                            Text("Cash")
                                .padding(.leading, 20)
                            Image(systemName: isExpand ? "chevron.up" : "chevron.down")
                                .padding()
                            Spacer()
                        } .foregroundColor(Colors.green01)
                        
                    )
                    .onTapGesture {
                        withAnimation(Animation.spring()) {
                            self.isExpand.toggle()
                        }
                    }
                    //.clipShape(RoundRect(radius: 18))
                    .anchorPreference(key: BoundsPreferenceKey.self, value: .bounds) { $0 }
                    .overlayPreferenceValue(BoundsPreferenceKey.self) { preferences in
                        GeometryReader { reader in
                                if isExpand {
                                    preferences.map { value in
                                        InsideRectangle(isExpand: $isExpand).eraseToAnyView()
                                        .offset(x: 0 , y: reader[value].maxY )
                                        .animation(.easeIn)
                                    }
                                } else {
                                    EmptyView().eraseToAnyView()
                                }
                            }
                        }
        }
    }
}

@available(iOS 14.0, *)
struct InsideRectangle: View {
    @Binding var isExpand:Bool
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 350, height: 200)
                .foregroundColor(Colors.green02)
                .opacity(isExpand ? 1: 0)
                .overlay(InnerListView(isExpand: $isExpand))
            }
        }
}

@available(iOS 14.0, *)
struct InnerListView: View {
    @Binding var isExpand:Bool
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "airplane.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .scaledToFit()
                    .padding(.leading, 20)
                
                Text("Flight Ticket")
                    .padding(.all, 10)
                
                Spacer()
                
                Text("$150")
                    .font(.headline)
                    .padding(.trailing, 20)
            }
            .frame(height: 70)
            .foregroundColor(Colors.green03)
            .opacity(isExpand ? 1: 0)
            .background(
                Rectangle().foregroundColor(.white))
            Spacer()
        }//.padding(.horizontal, 10)
    }
}


struct ExpandableCardView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 14.0, *) {
            ExpandableCardView()
        } else {
            // Fallback on earlier versions
        }
    }
}
