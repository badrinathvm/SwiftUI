//
//  ListScaleEffectView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 12/20/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

// ---  Model ----
class ListData:ObservableObject {
    @Published var activities: [ListModel] = []
    @Published var scales:[Bool] = []
    
    init() {
       activities = [
            ListModel(id: UUID(), image: "airplane.circle.fill", header: "Travel", amount: "$5.00", dueDays: "~6 days"),
            ListModel(id: UUID(), image: "bag.circle", header: "Baggage",amount: "$120.10",dueDays: "~10 days"),
            ListModel(id: UUID(), image: "arrowshape.zigzag.forward.fill", header: "Direction", amount: "$145.17", dueDays: "~15 days"),
            ListModel(id: UUID(), image: "badge.plus.radiowaves.forward", header: "Radio", amount: "$120.17", dueDays: "~15 days"),
            ListModel(id: UUID(), image: "bicycle", header: "Bicycle", amount: "$125.17", dueDays: "~10 days"),
            ListModel(id: UUID(), image: "bitcoinsign.square", header: "BitCoin", amount: "$135.17", dueDays: "~10 days"),
            ListModel(id: UUID(), image: "briefcase.fill", header: "Briefcase", amount: "$142.17", dueDays: "~12 days")
       ]
    
      scales = Array(repeating: false, count: activities.count)
    }
    
    func updateScaleEffect(index: Int) {
        //reset everything before change.
        scales = Array(repeating: false, count: activities.count)
        //check if index exists in the array
        let isValidIndex = scales.indices.contains(index)
        if isValidIndex {
            scales[index].toggle()
        }
    }
}

struct ListModel: Identifiable, Hashable {
    var id: UUID
    var image:String
    var header:String
    var amount: String
    var dueDays:String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

// ----- VIEW -----

@available(iOS 14.0, *)
struct ListScaleEffectView: View {
    //@State private var scale:Bool = false // required for approach 1
    @State private var scalingFactor: CGFloat = 1
    @StateObject var mainModel = ListData()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                // this gets the scroll position
                ScrollViewReader { value in
                    VStack(spacing: 20) {
                        ScrollView(Axis.Set.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(mainModel.activities.indices, id: \.self) { index in
                                    ButtonView(scalingFactor: $scalingFactor, mainModel: mainModel, index: index,scrollProxy: value)
                                }
                            }.padding()
                        }
                        ScaledRectagleView(scalingFactor: $scalingFactor, mainModel: mainModel, scrollProxy: value)
                    }
                }
            }
            .navigationBarTitle(Text("Bills"))
        }
    }
}

@available(iOS 14.0, *)
struct ButtonView: View {
    @Binding var scalingFactor:CGFloat
    @ObservedObject var mainModel: ListData
    var index:Int
    var scrollProxy:ScrollViewProxy
    var body: some View {
        Button(action: {
            let animation = Animation.easeInOut(duration: 0.5)
            withAnimation(animation) {
                self.scalingFactor = 1.05
                mainModel.updateScaleEffect(index: index)
                scrollProxy.scrollTo(index, anchor: .center)
            }
            
            /* Approach 1: reset the animation back.
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(animation) {
                    self.scale.toggle()
                }
            }*/
        }) {
            Text(mainModel.activities[index].header)
                .foregroundColor(.white)
                .frame(height: 20)
        }.padding()
        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.blue))
    }
}

@available(iOS 14.0, *)
struct ScaledRectagleView: View {
    @Binding var scalingFactor:CGFloat
    @ObservedObject var mainModel: ListData
    var scrollProxy:ScrollViewProxy
    
    var body: some View {
            ForEach(mainModel.activities.indices, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 16)
                        .id(index) // tie id which is required to scroll to particular position.
                        .frame(height: 85)
                        .foregroundColor(Color.white)
                        .shadow(color: Color.gray, radius: 1, x: 0, y: 0)
                        .overlay(listBodyView(mainModel.activities[index]))
                        //Approach 2: Have a modifier to reverse scale the animation.
                        .modifier(ReversingScale(to: mainModel.scales[index] ? scalingFactor : 1.0) {
                            DispatchQueue.main.async {
                                withAnimation(Animation.easeInOut(duration: 0.5)) {
                                    self.scalingFactor = 1
                                }
                            }
                        })
                        .padding(.horizontal, 20)
          }
    }
    
    
    func listBodyView(_ model: ListModel) -> some View {
        return  HStack(alignment: .midAlignment, spacing: 16) {
            Image(systemName: model.image)
                .resizable()
                .frame(width: 40, height: 40)
                .alignmentGuide(.midAlignment) { dimension in dimension[.bottom] / 2}
                .foregroundColor(Color.red)
                        
            VStack(alignment: .leading, spacing: 5) {
                Text(model.header)
                    .foregroundColor(Color.black)
                    .font(Font.system(size: 14, weight: Font.Weight.regular))
                Text(model.dueDays)
                    .font(Font.system(size: 12, weight: Font.Weight.light))
                    .foregroundColor(Color.gray)
                    .alignmentGuide(.midAlignment) { dimension in dimension[.bottom] / 2}
                Text(model.amount)
                    .font(Font.system(size: 16, weight: Font.Weight.medium))
            }
        
           Spacer()
            
            Image(systemName: "dot.arrowtriangles.up.right.down.left.circle")
                .foregroundColor(Color.gray)
                .alignmentGuide(.midAlignment) { dimension in dimension[.bottom] / 2}
        
       }.padding()
    }
}

struct ListScaleEffectView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 14.0, *) {
            ListScaleEffectView()
            //ContentView2()
        } else {
            // Fallback on earlier versions
        }
    }
}


/*
func scaledRectangleView(_ model: ListModel) -> some View {
    return RoundedRectangle(cornerRadius: 16)
        .frame(height: 85)
        .foregroundColor(Color.white)
        .shadow(color: Color.gray, radius: 1, x: 0, y: 0)
        .overlay(listBodyView(model))
        //Approach 2: Have a modifier to reverse scale the animation.
        .modifier(ReversingScale(to: scalingFactor) {
            DispatchQueue.main.async {
                withAnimation(Animation.easeInOut(duration: 0.5)) {
                    self.scalingFactor = 1
                }
            }
        })
    .padding(.horizontal, 20)
    //Approach 1: use scale Effect and reset the animation block with some timer.
    //.scaleEffect(self.scale ? 1.05 : 1)
}
*/
