//
//  ExpandableCardView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 12/22/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

struct SectionData: Identifiable, Hashable {
    var id:UUID
    var image:String
    var title:String
    var releaseDate:String
    var language:String
    var overview:String
}


struct CategoryData:Identifiable,Hashable {
    var id = UUID()
    var index:Int
    var title:String
    var sections: [SectionData]

    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
//    static func cardData() -> [CategoryData] {
//        return [CategoryData(index: 0, title: "Cars", sections: [
//            SectionData(id: UUID(), image: "car.circle.fill", title: "Lancer", price: "$13,500"),
//            SectionData(id: UUID(), image: "car.circle.fill", title: "Mazda", price: "$26,500")
//                            ]),
//                CategoryData(index: 1, title: "Groceries",sections: [
//                    SectionData(id: UUID(), image: "cart.fill", title: "Vegetables", price: "$15.26"),
//                    SectionData(id: UUID(), image: "cart.fill", title: "Fruits", price: "$35.12")
//                   ]),
//                CategoryData(index: 2, title: "Devices",sections: [
//                    SectionData(id: UUID(), image: "iphone", title: "iPhone", price: "$800"),
//                    SectionData(id: UUID(), image: "headphones", title: "Samsung", price: "$750")
//                   ])
//              ]
//    }
}

@available(iOS 14.0, *)
struct ExpandableListView: View {
    @State private var selectedCells: Set<CategoryData> = []
    @State var cardData: [CategoryData] = []
    @StateObject private var networkData = Network()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            //log("Before :: Selected Cell content is \(self.selectedCells))")
            ForEach(cardData, id: \.self) { data in
                //log("Data :: \(data.id)")
                //log("After :: Selected Cell content is \(self.selectedCells) ---> \(self.selectedCells.contains(data))")
                ExpandableCardView(isExpand: self.selectedCells.contains(data), data: data)
                    .onTapGesture {
                        withAnimation(Animation.spring()) {
                            if self.selectedCells.contains(data) {
                                self.selectedCells.remove(data) // collapsing
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
        .offset(y: 10)
        .onAppear {
               //make network call and set the data.
                self.networkData.fetchDataFromNetwork { results in
                    self.cardData = networkData.movieData(movies: results)
                }
        }
    }
}

@available(iOS 14.0, *)
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

@available(iOS 14.0, *)
struct InsideRectangleContent: View {
    var data:CategoryData
    var body: some View {
//            RoundedCorner(radius: 18, corners: [])
//                .strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1))
//                .background(Rectangle().foregroundColor(Color.gray.opacity(0.1)))
//                .frame(width: 350)
//                .frame(maxHeight: .infinity)
//                .padding(.top, -6)
//                .overlay(
//                    InnerListView(data: data, heightValue: $heightValue)
//                )
        
        ForEach(0..<data.sections.count) { index in
            InnerContentView(data: data, index: index)
        }
            
    }
}

@available(iOS 14.0, *)
struct InnerContentView: View {
    @State private var showText:Bool = false
    var data:CategoryData
    var index: Int
    var body: some View {
        let sectionEntry = data.sections[index]
        VStack {
            HStack {
                ZStack {
                    CircleAnimationTemplateView(showText: $showText).frame(width: 40, height: 40)
                    Image(systemName: sectionEntry.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Colors.green03)
                }.padding(.leading, 10)

                VStack(alignment: .leading, spacing: 2) {
                    Text(sectionEntry.title)
                        .font(.callout)
                    if !showText {
                        Text("Updating")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }

                Spacer()
                
                Text(sectionEntry.releaseDate)
                    .font(.callout)
                    .padding(.trailing, 20)
            }
            Text(sectionEntry.overview)
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
                .padding(.all, 10)
            
            if index != data.sections.count - 1 {
                Divider()
            }
        }
        .frame(width: 350)
        .background(
            RoundedCorner(radius: 18, corners: [])
                        .strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1))
                        .background(Rectangle().foregroundColor(Color.gray.opacity(0.1)))
                        .padding(.top, -6)
        )
    }
}

@available(iOS 14.0, *)
struct ExpandableListView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableListView()
    }
}


struct GeometryGetter: View {
    @Binding var rect: CGRect

    var body: some View {
        GeometryReader { (g) -> Path in
            print("width: \(g.size.width), height: \(g.size.height)")
            DispatchQueue.main.async { // avoids warning: 'Modifying state during view update.' Doesn't look very reliable, but works.
                self.rect = g.frame(in: .global)
            }
            return Path() // could be some other dummy view
        }
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



