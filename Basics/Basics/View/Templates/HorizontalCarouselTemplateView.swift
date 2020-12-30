//
//  HorizontalCarouselTemplateView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 12/25/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

struct Caraousel {
    var id: UUID
    var title: String
    var overview: String
    var imageLink:String
    var status: Bool
}

class CaraouselData: ObservableObject {
    @Published var carousel : [Caraousel] = []
    @Published var heights: [CGFloat] = []
    @Published var overviewHeights: [CGFloat] = []
    @Published var imageHeight:CGFloat = 10.0
    @Published var headerHeight:CGFloat = 10.0
    
    func updateCards(index: Int) {
        self.carousel[index].status.toggle()
    }
}

@available(iOS 14.0, *)
struct HorizontalCarouselTemplateView: View {
    @StateObject var carouselData = CaraouselData()
    @StateObject var network = Network()
    @State private var movieData: [Caraousel] = []
    @Namespace var animation
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    @State private var vStackSize: CGFloat?
    @State private var percentage:CGFloat = 0
    @State private var showLoader:Bool = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color.primary
                .edgesIgnoringSafeArea(.all)
            VStack {
                Button(action: {
                    self.viewControllerHolder?.dismissView({
                        // final clean up if any ..
                    })
                }) {
                    Text("Close")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .foregroundColor(Color.blue)
                        .padding()
                }
                Spacer()
                
                if showLoader {
                    GeometryReader { reader in
                        ScrollView(Axis.Set.horizontal, showsIndicators: false) {
                            HStack(spacing: 25) {
                                ForEach(0..<carouselData.carousel.count, id: \.self) { index in
                                    let carouselEntry = carouselData.carousel[index]
                                    if carouselEntry.status {
                                        VStack {
                                            MovieContentView(movieData: carouselEntry, index: index, carouselData: carouselData, vStackHeight: $vStackSize)
                                                .transition(carouselData.carousel[index].status ? .identity : .slide)
                                                .background(RoundedCorner(radius: 18, corners: [])
                                                                .cornerRadius(18, corners: [.topLeft, .topRight, .bottomLeft, .bottomRight])
                                                                .foregroundColor(Color.white))
                                                .frame(width: 350, height: self.vStackSize)
                                        }
                                    }
                                }
                            }.padding()
                        }
                   }
                }
            }
            
            // place to put loader
            LoaderView(percentage: $percentage)
                .opacity(showLoader ? 0 : 1)
                .onReceive(timer) { timer in
                    if !self.carouselData.carousel.isEmpty {
                        self.timer.upstream.connect().cancel()
                        withAnimation(.spring()) {
                            showLoader.toggle()
                        }
                    }
                    self.percentage += 0.10
                }
        }
        .onAppear {
            self.network.fetchDataFromNetwork { (movies) in
                for movie in movies.results {
                    movieData.append(Caraousel(id: UUID(), title: movie.title, overview: movie.overview, imageLink: movie.backdropPath, status: true))
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                    self.carouselData.carousel = movieData
                }
            }
        }
    }
}

struct LoaderView: View {
    @Binding var percentage:CGFloat
    var body: some View {
        ZStack {
//           Circle()
//               .trim(from: 0, to: 1)
//               .stroke(Color(red: 245/255, green: 245/255, blue: 245/255), lineWidth: 10)
//               .frame(height: 80)
           Circle()
               .trim(from: 0, to: percentage)
               .stroke(Colors.green03, style: StrokeStyle(lineWidth: 10, lineCap: CGLineCap.round))
               .shadow(radius: 4)
               .rotation3DEffect(Angle.degrees(360), axis: (x: 1, y: 0, z: 0))
               .frame(height: 70)
               .animation(.easeOut)
        }
        
        
        
        //.opacity(!self.carouselData.carousel.isEmpty ? 0 : 1)
            //.fontWeight(.semibold)
            //.foregroundColor(.blue)
            
    }
}

@available(iOS 14.0, *)
struct MovieContentView: View {
    var movieData: Caraousel
    var index: Int
    @ObservedObject var carouselData:CaraouselData
    @StateObject var imageLoader: ImageNetwork = ImageNetwork()
    @Binding var vStackHeight: CGFloat?
    var body: some View {
        VStack {
            VStack {
                HStack(alignment: .midAlignment) {
                    Text(movieData.title)
                        .foregroundColor(Color.black)
                        .font(Font.system(size: 24, weight: Font.Weight.medium))
                        .alignmentGuide(.midAlignment) { dimension in dimension[.bottom] / 2}
                        .padding(.top, 10)
                        .padding(.leading)
                        
                    Spacer()
                    
                    Image("close")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .alignmentGuide(.midAlignment) { dimension in dimension[.bottom] / 2}
                        .padding([.trailing, .top])
                        .onTapGesture {
                            withAnimation(Animation.spring()) {
                                carouselData.updateCards(index: index)
                            }
                        }
                }.background(GeometryReader { proxy in
                    Color.clear.preference(key: HeaderHeightKey.self, value: proxy.size.height)
                 })
                .onPreferenceChange(HeaderHeightKey.self) { value in
                    self.carouselData.headerHeight = value
                }
                
                if imageLoader.imageFromNetwork != nil {
                    Image(uiImage: imageLoader.imageFromNetwork! )
                        .resizable()
                        .frame(width: 320, height: 150)
                        .aspectRatio(contentMode: .fit)
                        .background(GeometryReader { proxy in
                            Color.clear.preference(key: ImageHeightKey.self, value: proxy.size.height)
                         })
                        .onPreferenceChange(ImageHeightKey.self) { value in
                            self.carouselData.imageHeight = value
                            //print("Image height is \(value)")
                        }
                }
                
                VStack {
                    Text(movieData.overview)
                        .layoutPriority(1)
                        .foregroundColor(Color.gray)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                        .padding( [.all], 20)
                }
                .background(GeometryReader { proxy in
                    Color.clear.preference(key: OverviewHeightKey.self, value: proxy.size.height)
                 })
                .onPreferenceChange(OverviewHeightKey.self) { value in
                    self.carouselData.overviewHeights.append(value)
                }
            }
            .background(GeometryReader { proxy in
                Color.clear.preference(key: SiblingHeightKey.self, value: [proxy.size.height])
             })
            .onPreferenceChange(SiblingHeightKey.self) { value in
                self.carouselData.heights.append(contentsOf: value)
                if self.carouselData.overviewHeights.count > 0 {
                   //self.vStackHeight = self.carouselData.heights.max()! + (self.carouselData.overviewHeights.max()! / 5 ) // calculate  or
                    let totalHeightofAllComponents = self.carouselData.overviewHeights.max()! + self.carouselData.imageHeight + self.carouselData.headerHeight
                    self.vStackHeight = totalHeightofAllComponents + 40
                }
            }
            Spacer()
        }
        .onAppear {
            imageLoader.fetchImageFromNetwork(url: movieData.imageLink)
        }
    }
}

@available(iOS 14.0, *)
struct HorizontalCarouselTemplateView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalCarouselTemplateView()
    }
}

struct HeaderHeightKey: PreferenceKey {
    static var defaultValue: CGFloat = 10.0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct ImageHeightKey: PreferenceKey {
    static var defaultValue: CGFloat = 10.0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct OverviewHeightKey: PreferenceKey {
    static var defaultValue: CGFloat = 10.0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct SiblingHeightKey: PreferenceKey {
    typealias Value = [CGFloat]
    static var defaultValue: Value = []

    static func reduce(value: inout Value, nextValue: () -> Value) {
        value.append(contentsOf: nextValue())
    }
}
