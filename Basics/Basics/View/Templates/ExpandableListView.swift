//
//  ExpandableCardView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 12/22/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

struct SectionData: Identifiable, Hashable {
    var id:UUID =  UUID()
    var image:String
    var title:String
    var price:String
}

struct CategoryData:Identifiable,Hashable {
    var id = UUID()
    var index:Int
    var title:String
    var sections: [SectionData]

    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func cardData() -> [CategoryData] {
        return [CategoryData(index: 0, title: "Cars", sections: [
                             SectionData(image: "car.circle.fill", title: "Lancer", price: "$13,500"),
                             SectionData(image: "car.circle.fill", title: "Mazda", price: "$26,500")
                            ]),
                CategoryData(index: 1, title: "Groceries",sections: [
                    SectionData(image: "cart.fill", title: "Vegetables", price: "$15.26"),
                    SectionData(image: "cart.fill", title: "Fruits", price: "$35.12")
                   ]),
                CategoryData(index: 1, title: "Devices",sections: [
                    SectionData(image: "iphone", title: "iPhone", price: "$800"),
                    SectionData(image: "headphones", title: "Samsung", price: "$750")
                   ])
              ]
    }
}

struct ExpandableListView: View {
    @State private var selectedCells: Set<CategoryData> = []
    var cardData = CategoryData.cardData()

    var body: some View {
        ScrollView {
            ForEach(cardData, id: \.self) { data in
                ExpandableCardView(isExpand: self.selectedCells.contains(data), data: data)
                    .onTapGesture {
                        withAnimation(Animation.spring()) {
                            if self.selectedCells.contains(data) {
                                self.selectedCells.remove(data)
                            } else {
                                self.selectedCells.insert(data)
                            }
                        }
                    }
                    .padding(.bottom, -10)
                    .animation(Animation.spring())
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 10)
        .offset(y: 100)
    }
}


struct ExpandableCardView: View {
    var isExpand:Bool
    var data: CategoryData
    var body: some View {
        VStack {
                RoundedCorner(radius: 18, corners:data.index == 0 ? [.topLeft, .topRight] : [])
                    .strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1.0))
                    .background(Rectangle().foregroundColor(Color.white))
                    .frame(width: 350, height: 50)
                    .cornerRadius(18, corners:data.index == 0 ? [.topLeft, .topRight] : [])
                    .overlay(
                        HStack {
                            Text(data.title)
                                .font(.callout)
                                .padding(.leading, 20)
                            Spacer()
                            Image(systemName: isExpand ? "chevron.up" : "chevron.down")
                                .padding()
                        }.foregroundColor(Color.black)
                    )
            
            if isExpand {
                InsideRectangleContent(data: data)
                    .padding(.top, -2)
            }
        }
    }
}

struct InsideRectangleContent: View {
    var data:CategoryData
    var body: some View {
        RoundedCorner(radius: 18, corners: [])
            .strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1))
            .background(Rectangle().foregroundColor(Color.gray.opacity(0.1)))
            .frame(width: 350, height: 130)
            .padding(.top, -6)
            .overlay(
                InnerListView(data: data)
            )
    }
}

struct InnerListView: View {
    var data:CategoryData
    var body: some View {
        ForEach(0..<data.sections.count) { index in
            let sectionEntry = data.sections[index]
            VStack {
                HStack {
                    Image(systemName: sectionEntry.image)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .scaledToFit()
                        .padding(.leading, 20)
                    
                    Text(sectionEntry.title)
                        .font(.callout)
                        .padding(.all, 10)
                    
                    Spacer()
                    
                    Text(sectionEntry.price)
                        .font(.callout)
                        .padding(.trailing, 20)
                }
                
                if index != data.sections.count - 1 {
                    Divider()
                }
            }
        }
    }
}

struct ExpandableListView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableListView()
    }
}


//struct ExpandableCardView: View {
//    var isExpand:Bool
//    var data: CardData
//    var body: some View {
//        VStack(spacing:0) {
//            log("\(data.title)")
//            TopRectangle(isExpand: isExpand, data: data)
//                    //.clipShape(RoundRect(radius: 18))
//                    .anchorPreference(key: BoundsPreferenceKey.self, value: .bounds) { $0 }
//                    .overlayPreferenceValue(BoundsPreferenceKey.self) { preferences in
//                        GeometryReader { reader in
//                                if isExpand {
//                                    preferences.map { value in
//                                        InsideRectangle(isExpand: isExpand).eraseToAnyView()
//                                        .offset(x: 0 , y: reader[value].maxY )
//                                    }
//                                } else {
//                                    EmptyView().eraseToAnyView()
//                                }
//                            }
//                    }
//        }
//    }
//}
