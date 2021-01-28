//
//  ScaledHorizontalScrollableView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 1/27/21.
//  Copyright © 2021 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

class ScrollCardViewModel: ObservableObject {
    @Published var data: [ScrollCard] = []
    
    init() {
        [
            ScrollCard(id: 0, img: "Arches", name: "Arches", show: false),
            ScrollCard(id: 1, img: "BryceCanyon", name: "BryceCanyon", show: false),
            ScrollCard(id: 2, img: "Canyonlands", name: "Canyonlands", show: false),
            ScrollCard(id: 3, img: "Utah", name: "Utah", show: false),
            ScrollCard(id: 4, img: "yosemite", name: "Yosemite", show: false),
            ScrollCard(id: 5, img: "Zion", name: "Zion", show: false),
            ScrollCard(id: 6, img: "y1", name: "Yosemite", show: false)
        ].forEach { (scrollCard) in
            data.append(scrollCard)
        }
    }
    
    func updateHeight(value : Int){
        //reset views
        for index in self.data.indices {
            self.data[index].show = false
        }
        //update the corresponsing one.
        self.data[value].show = true
    }
}

struct ScaledHorizontalScrollableView : View {
    @State var xPosition : CGFloat = 0
    @State var count : CGFloat = 0
    @State var offsetPlacement : CGFloat = 0
    @ObservedObject var viewModel = ScrollCardViewModel()
    var screen = UIScreen.main.bounds.width - 30
    let offset:CGFloat  = 15
    
    var body : some View{
        NavigationView{
            VStack{
                Spacer()
                HStack(spacing: 15){
                    ForEach(viewModel.data.indices, id: \.self) { index in
                        ScrollCardView(data: viewModel.data[index])
                            .offset(x: self.xPosition)
                            .highPriorityGesture(
                                DragGesture()
                                    .onChanged{ value in
                                            onChanged(value: value)
                                    }
                                    .onEnded { value in
                                        onEnded(value: value)
                                    })
                    }
                }
                .frame(width: UIScreen.main.bounds.width)
                .offset(x: self.offsetPlacement)
                Spacer()
            }
            .background(Color.black.opacity(0.07).edgesIgnoringSafeArea(.bottom))
            .navigationBarTitle("Carousel List")
            .animation(.spring())
            .onAppear {
                self.offsetPlacement = (self.screen + offset) * CGFloat( viewModel.data.count / 2 )
                print(self.offsetPlacement)
                viewModel.data[0].show = true
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
                viewModel.updateHeight(value: Int(self.count))
            }
            //set the xPosition with screen position times the count of the card
            self.xPosition = -((self.screen + offset) * self.count)
        }
        else {
            //right swipe , make sure card count != total cards count - 1
            if -value.translation.width > self.screen / 2  && Int(self.count) !=  (viewModel.data.count - 1) {
                //when moved right , increment the count of the card & update the height of right card
                self.count += 1
                viewModel.updateHeight(value: Int(self.count))
            }
            //set the xPosition with screen position times the count of the card
            self.xPosition = -((self.screen + offset) * self.count)
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
        .frame(width: UIScreen.main.bounds.width - 30, height: data.show ? 500 : 440)
        .background(Color.white)
        .cornerRadius(25)
    }
}

struct ScrollCard : Identifiable, Hashable {
    var id : Int
    var img : String
    var name : String
    var show : Bool
}


// OnAppear

// self.offsetPlacement = ( (self.screen + offset) * CGFloat( viewModel.data.count / 2) ) - ( viewModel.data.count % 2 == 0 ? (self.screen + offset) / 2 : 0)
