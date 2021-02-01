//
//  ScaledHorizontalScrollableView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 1/27/21.
//  Copyright © 2021 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

struct TestScrollCardView: View {
    var body: some View {
        VStack {
            ScaledHorizontalScrollableView()
                .addCards(generateCards())
                .setActiveCardHeight(400)
                .animation(.spring())
        }
    }
    
    func generateCards() -> [ScrollCardView] {
        var cards = [ScrollCardView]()
        let items = [
            ScrollCard(id: 0, img: "Arches", name: "Arches"),
            ScrollCard(id: 1, img: "BryceCanyon", name: "BryceCanyon"),
            ScrollCard(id: 2, img: "Canyonlands", name: "Canyonlands"),
            ScrollCard(id: 3, img: "Utah", name: "Utah"),
            ScrollCard(id: 4, img: "y1", name: "Yosemite"),
            ScrollCard(id: 5, img: "Zion", name: "Zion")
        ]
        
        for card in items {
            cards.append(ScrollCardView(data: card))
        }
        return cards
    }
}


class CaraouselCardViewModel: ObservableObject {
    @Published var cardHeight: [Bool] = []
    
    func updateCard(count: Int) {
        cardHeight = Array(repeating: false, count: count)
    }
    
    func updateCardHeight(for index : Int){
        cardHeight = Array(repeating: false, count: cardHeight.count)
        cardHeight[index] = true
    }
}

struct ScaledHorizontalScrollableView:View {
    var screen = UIScreen.main.bounds.width - 30
    let offsetSpacing:CGFloat = 15
    @State var xPosition : CGFloat = 0
    @State var count : CGFloat = 0
    @State var offsetPlacement : CGFloat = 0
    @ObservedObject var viewModel = CaraouselCardViewModel()

    /// contains list of cards to be rendered next to each other
    @Environment(\.cards) var cards
    
    /// contains number of cards added in the caraousel
    @Environment(\.cardCount) var cardCount
    
    /// contains number of cards added in the caraousel
    @Environment(\.activeHeight) var activeHeight
    
    var body : some View {
            VStack {
                HStack(spacing: offsetSpacing ) {
                    ForEach(cards.indices, id: \.self) { index in
                        if viewModel.cardHeight.count > 0 {
                            cards[index]
                                .offset(x: self.xPosition)
                                .highPriorityGesture(
                                    DragGesture()
                                        .onChanged{ value in
                                                onChanged(value: value)
                                        }
                                        .onEnded { value in
                                            onEnded(value: value)
                                        })
                                .frame(width: screen, height: viewModel.cardHeight[index] ? activeHeight : activeHeight - 80)
                        }
                    }
                }
                .offset(x: self.offsetPlacement)
            }
            .onAppear {
                // condition for even/odd number of cards.
                let decideSpacingBetweenEvenOddCards =  cards.count % 2 == 0 ? (self.screen + offsetSpacing) / 2 : 0
                self.offsetPlacement = (self.screen + offsetSpacing) * CGFloat( cards.count / 2)  - decideSpacingBetweenEvenOddCards

                if cardCount > 0  {
                    viewModel.updateCard(count: cardCount)
                }
            }
    }
    
    func onChanged(value: DragGesture.Value) {
        if value.translation.width > 0 {
            //scrolled to right, just assign the location position.
            self.xPosition = value.location.x
        }
        else{
            //when scrolled left because value will be negative.
            self.xPosition = value.location.x - self.screen
        }
    }
    
    func onEnded(value: DragGesture.Value) {
        if value.translation.width > 0 {
            // left swipe, make sure count is not the first card.
            if value.translation.width > (self.screen / 2) && Int(self.count) != 0 {
                //when moved left , decrement the count of the card & update the height of left card
                self.count -= 1
                viewModel.updateCardHeight(for: Int(self.count))
            }
            //set the xPosition with screen position times the count of the card
            self.xPosition = -((self.screen + offsetSpacing) * self.count)
        }
        else {
            //right swipe , make sure card count != total cards count - 1
            if -value.translation.width > self.screen / 2  && Int(self.count) !=  (cards.count - 1) {
                //when moved right , increment the count of the card & update the height of right card
                self.count += 1
                viewModel.updateCardHeight(for: Int(self.count))
            }
            //set the xPosition with screen position times the count of the card
            self.xPosition = -((self.screen + offsetSpacing) * self.count)
        }
    }
}

struct ScrollCardView : View {
    var data : ScrollCard
    var body : some View{
        VStack(alignment: .leading, spacing: 0){
            Image(data.img)
                .resizable()
            Text(data.name)
                .fontWeight(.bold)
                .padding(.vertical, 13)
                .padding(.leading)
        }
        .background(Color.white)
        .cornerRadius(25)
    }
}

struct ScrollCard : Identifiable, Hashable {
    var id : Int
    var img : String
    var name : String
}


// OnAppear
// self.offsetPlacement = ( (self.screen + offset) * CGFloat( viewModel.data.count / 2) ) - ( viewModel.data.count % 2 == 0 ? (self.screen + offset) / 2 : 0)


/// Environment Key for Steps
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
struct CardsKey: EnvironmentKey {
    /// provide a default value for custom dependency
    static var defaultValue = [AnyView]()
}

/// Environment Key for Steps
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
struct CardsCountKey: EnvironmentKey {
    /// provide a default value for custom dependency
    static var defaultValue:Int = 0
}

/// Environment Key for Steps
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
struct ActiveCardHeightKey: EnvironmentKey {
    /// provide a default value for custom dependency
    static var defaultValue:CGFloat = 200
}



extension EnvironmentValues {
    /// property wrapper  for `StepsKey`
    var cards: [AnyView] {
        get { self[CardsKey.self] }
        set { self[CardsKey.self] = newValue }
    }
    
    var cardCount: Int {
        get { self[CardsCountKey.self] }
        set { self[CardsCountKey.self] = newValue }
    }
    
    var activeHeight: CGFloat {
        get { self[ActiveCardHeightKey.self] }
        set { self[ActiveCardHeightKey.self] = newValue }
    }
}

extension View {
    /// Configures Steps to environment value
    func addCards<Cell:View>(_ cards: [Cell]) -> some View {
        VStack {
            self.environment(\EnvironmentValues.cards, cards.map { $0.eraseToAnyView() })
            self.environment(\EnvironmentValues.cardCount, cards.count)
        }
    }
    
    func setActiveCardHeight(_ height: CGFloat) -> some View {
        self.environment(\EnvironmentValues.activeHeight, height)
    }
}
