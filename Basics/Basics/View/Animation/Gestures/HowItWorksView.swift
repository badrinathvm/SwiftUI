//
//  HowItWorksView.swift
//  BUPNative
//
//  Created by Venkatnarayansetty, Badarinath on 3/24/20.
//

import SwiftUI

#if canImport(SwiftUI) && !arch(arm) && !arch(i386)
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
struct HowItWorksView: View {
    var body: some View {
        ScrollView(Axis.Set.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(0..<3) { _ in
                    RoundedRectangle(cornerRadius: 8)
                        //.overlay(Text("How It Works"))
                        .foregroundColor(Color.white)
                        .frame(width: 279, height: 96)
                        .border(Color.black)
                        //.shadow(color: Color.gray, radius: 8.0, x: 0, y: 0)
                }
            }.padding(.horizontal, 16)
        }
       
    }
    
//    private var howItWorksBody: some View {
//        HStack(spacing: 8) {
//            howItWorksImage
//            howItWorksText
//        }.background(roundedRectangle)
//    }
    
//    private var howItWorksImage:some View {
//        Image("lightBulb")
//            .resizable()
//            .frame(width: 48, height: 48)
//            .aspectRatio(contentMode: .fit)
//            //.padding(.vertical, 24)
//    }
//
//    private var howItWorksText: some View {
//        Text("Easily compare rates from multiple Partners")
//            .foregroundColor(Color(UIColor.PreQualGreyColor))
//            .font(.system(size: CGFloat(FontSize.fifteen.rawValue), weight: .medium))
//            //.padding(.vertical,28)
//            //.padding(.trailing, 18)
//    }
//
//    private var roundedRectangle: some View {
//        RoundedRectangle(cornerRadius: CGFloat(BUPNativeConstants.OffersMarketplace.offerTileRadius))
//        .foregroundColor(Color.white)
//        .shadow(color: Color(UIColor.Gray2), radius: CGFloat(BUPNativeConstants.Prequal.CardRadius / 3), x: 0, y: 0)
//        .frame(width: 279, height: 96)
//        //.padding(.vertical, BUPNativeConstants.OffersMarketplace.Spacing.halfSpacing)
//    }
}
#endif

