//
//  CarouselSliderTemplateView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 12/28/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

struct Card: Identifiable, Hashable {
    var id: UUID
    var color: Color
    var title: String
    var offset: CGFloat = 0
    

    var content = "Humans have long used cognitive enhancement methods to expand the proficiency and range of the various mental activities that they engage in, including writing to store and retrieve information, and computers that allow them to perform myriad activities that are now commonplace in the internet age. Neuroenhancement describes the use of neuroscience-based techniques for enhancing cognitive function by acting directly on the human brain and nervous system, altering its properties to increase performance. Cognitive neuroscience has now reached the point where it may begin to put theory derived from years of experimentation into practice. This special issue includes 16 articles that employ or examine a variety of neuroenhancement methods currently being developed to increase cognition in healthy people and in patients with neurological or psychiatric illness.This includes transcranial electromagnetic stimulation methods, such as transcranial direct current stimulation (tDCS) and transcranial magnetic stimulation (TMS), along with deep brain stimulation, neurofeedback, behavioral training techniques, and these and other techniques in conjunction with neuroimaging."
}

class CardViewModel: ObservableObject {
    @Published var cards: [Card] = [
        Card(id: UUID(), color: Color.red,  title: "Title1"),
        Card(id: UUID(), color: Color.green, title: "Title2"),
        Card(id: UUID(), color: Color.yellow, title: "Title3"),
        Card(id: UUID(), color: Color.blue, title: "Title4")
    ]
    
    var height:CGFloat  = 400
    
    @Published var swipedCard: Int = 0
    
    //Detail Content
    @Published var showCard = false
    @Published var selectedCard = Card(id: UUID(), color: Color.clear, title: "")
    @Published var showContent = false
}

let width = UIScreen.main.bounds.size.width

@available(iOS 14.0 , *)
struct ExpandedView: View {
    @EnvironmentObject var cardViewModel: CardViewModel
    var animation: Namespace.ID
    var body: some View {
        ZStack {
            VStack {
                
                Text("Hello")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .padding(.top, 10)
                    .font(.caption)
                    .foregroundColor(Color.white)
                    .matchedGeometryEffect(id: "hello-\(cardViewModel.selectedCard.id)", in: animation)
                
                Text(cardViewModel.selectedCard.title)
                    .foregroundColor(Color.white)
                    .font(.title)
                    .fontWeight(.bold)
                    .matchedGeometryEffect(id: "title-\(cardViewModel.selectedCard.id)", in: animation)
                
                if cardViewModel.showContent {
                    Text(cardViewModel.selectedCard.content)
                        .foregroundColor(Color.white)
                        .fontWeight(.semibold)
                        .padding()
                }
               
                
                Spacer(minLength: 0)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                cardViewModel.selectedCard.color
                    .cornerRadius(25.0)
                    .matchedGeometryEffect(id: "bg-\(cardViewModel.selectedCard.id)", in: animation)
                    .ignoresSafeArea(.all, edges: .bottom)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            cardViewModel.showCard.toggle()
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() +  0.3) {
                                withAnimation(Animation.easeIn) {
                                    cardViewModel.showContent = false
                                }
                            }
                        }
                    }
            )
            
            // close button
            VStack {
                Spacer()
                
                if cardViewModel.showContent{
                    
                    Button(action: CloseView, label: {
                        
                        Image(systemName: "arrow.down")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.blue)
                            .padding()
                            .background(Color.white.opacity(0.6))
                            .clipShape(Circle())
                            .padding(5)
                            .background(Color.white.opacity(0.7))
                            .clipShape(Circle())
                            .shadow(radius: 3)
                    })
                    .padding(.bottom)
                }
           }
    }
  }
    
    func CloseView(){
            withAnimation(.spring()){
                cardViewModel.showCard.toggle()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    withAnimation(.easeIn){
                        cardViewModel.showContent = false
                    }
                }
            }
        }
}

@available(iOS 14.0, *)
struct CardView: View {
    @EnvironmentObject var cardViewModel: CardViewModel
    var card: Card
    var animation: Namespace.ID
    var body: some View {
        VStack {
            Text("Hello")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.top, 10)
                .font(.caption)
                .foregroundColor(Color.white)
                .matchedGeometryEffect(id: "hello-\(card.id)", in: animation)
            
            Text(card.title)
                .foregroundColor(Color.white)
                .font(.title)
                .fontWeight(.bold)
                .matchedGeometryEffect(id: "title-\(card.id)", in: animation)
            
            Spacer(minLength: 0)
            
            HStack {
                Spacer()
                Text("Read More")
                    
                Image(systemName: "arrow.right")
            }
            .padding(.trailing, 20)
            .foregroundColor(.white)
            .padding(30)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(card.color.cornerRadius(25).matchedGeometryEffect(id: "bgColor-\(card.id)", in: animation))
        .onTapGesture {
            withAnimation(.spring()) {
                cardViewModel.showCard.toggle()
                cardViewModel.selectedCard = card
                
                DispatchQueue.main.asyncAfter(deadline: .now() +  0.3) {
                    withAnimation(Animation.easeIn) {
                        cardViewModel.showContent.toggle()
                    }
                }
            }
        }
    }
}

@available(iOS 14.0, *)
struct CarouselSliderTemplateView: View {
    @StateObject var cardViewModel = CardViewModel()
    @Namespace var animation
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    ForEach(cardViewModel.cards.indices.reversed(), id: \.self) { index in
                        log("\(index)")
                        HStack {
                            CardView(card: cardViewModel.cards[index], animation: animation)
                                .frame(width: getWidth(index: index), height: getHeight(index: index))
                                .offset(x:  getOffset(index: index))
                                .rotationEffect(.init(degrees: getCardRotation(index: index)))
                            Spacer(minLength: 0)
                        }
                        .frame(height: 400)
                        .contentShape(Rectangle())
                        .offset(x: cardViewModel.cards[index].offset)
                        .gesture(DragGesture(minimumDistance: 0)
                                .onChanged { (value) in
                                    onChanged(value: value, index: index)
                                }.onEnded { (value) in
                                        onEnded(value: value, index: index)
                            }
                        )
                    }
                }
                .padding(.top, 25)
                .padding(.horizontal, 30)
                
                Button(action: resetViews) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.blue)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(radius: 3)
                }.padding(.top, 35)
                Spacer()
            }
            
            
            //Detail view
            if cardViewModel.showCard {
                ExpandedView(animation: animation)
            }
        }.environmentObject(cardViewModel)
       
    }
    
    func resetViews() {
        for index in cardViewModel.cards.indices {
            withAnimation(Animation.spring()) {
                //reset the offset and swipe card positions.
                cardViewModel.cards[index].offset = 0
                cardViewModel.swipedCard = 0
            }
            
        }
    }
    
    func onChanged(value: DragGesture.Value, index: Int ) {
        // only left Swipe
        if value.translation.width < 0 {
            cardViewModel.cards[index].offset = value.translation.width
        }
    }
    
    func onEnded(value: DragGesture.Value, index: Int ) {
        withAnimation {
            //why negative since we are pushing the card to left value.transalation.widht will alareday be negative for eg : ▿ (-193.5, -0.5)
            if -value.translation.width > width / 3 {
                // thsi code executes when we swipe towards left
                cardViewModel.cards[index].offset = -width  // this will pus the rectangle to out side the visible section.
                cardViewModel.swipedCard += 1
            } else {
                // this code executes when we swipe towards right
                cardViewModel.cards[index].offset = 0
            }
        }
    }
    
    func getHeight(index: Int) -> CGFloat {
        let height:CGFloat = 400
        let cardHeight = index - cardViewModel.swipedCard <= 2 ? CGFloat(index-cardViewModel.swipedCard) * 35 : 70
        return height - cardHeight
    }
    
    func getWidth(index: Int) -> CGFloat {
        let screenWidth = UIScreen.main.bounds.width - 60 - 60
        // For First Three Cards....
        //let cardWidth = index <= 2 ? CGFloat(index) * 30 : 60
        return screenWidth
    }
    
    func getOffset(index: Int) -> CGFloat {
        // offset to display only three cards.
        return  index - cardViewModel.swipedCard <= 2 ? CGFloat(index - cardViewModel.swipedCard) * 30 : 60
    }
    
    func getCardRotation(index: Int)->Double{
           let boxWidth = Double(width / 3)
          // this offset value will set on `onChnaged` by the drag gesture.
           let offset = Double(cardViewModel.cards[index].offset)
           let angle : Double = 5
           return (offset / boxWidth) * angle
       }
}

@available(iOS 14.0, *)
struct CarouselSliderTemplateView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselSliderTemplateView()
    }
}
