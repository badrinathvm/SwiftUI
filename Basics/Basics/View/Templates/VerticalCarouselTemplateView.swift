//
//  VerticalCarouselTemplateView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 12/29/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

struct MovieCard: Identifiable {
    var id: UUID
    var title: String
    var overview: String
    var imageLink:String
    var status: Bool
    var offset: CGFloat = 0
}

class MovieviewModel: ObservableObject {
    @Published var movies : [MovieCard] = []
    @Published var swipedCard: Int = 0
}

@available(iOS 14.0, *)
struct MovieView: View {
    var card: MovieCard
    @StateObject var imageLoader: ImageNetwork = ImageNetwork()
    var body: some View {
        VStack {
            Text(card.title)
                .fontWeight(.semibold)
                .foregroundColor(Color.black)
                .font(.system(size: 16))
                .padding()
            
            if imageLoader.imageFromNetwork != nil {
                Image(uiImage: imageLoader.imageFromNetwork! )
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 150)
                    .aspectRatio(contentMode: .fit)
            }
            
            Spacer()
            
            Button(action: {}){
                Text("Mark as Viewed")
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                    .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // to retain the height and width set by the parent.
        .background(
            RoundedCorner(radius: 25)
                .strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1.0))
                .background(Rectangle().foregroundColor(Color.white))
                .cornerRadius(25, corners:[.topLeft, .topRight, .bottomLeft, .bottomRight])
        )
        .onAppear {
            self.imageLoader.fetchImageFromNetwork(url: card.imageLink)
        }
    }
}


@available(iOS 14.0, *)
struct VerticalCarouselTemplateView: View {
    @StateObject var movieViewModel = MovieviewModel()
    @StateObject var network = Network()
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    ForEach(Array(movieViewModel.movies.indices.prefix(5)), id: \.self) { index in
                        let cardEntry = movieViewModel.movies[index]
                        VStack {
                            MovieView(card: cardEntry)
                                .cornerRadius(25)
                                .frame(width: getWidth(for: index), height: 200)
                                .offset(y: getCardOffset(for: index))
                                .rotationEffect(.init(degrees: getRotation(for: index)))
                        }
                        .offset(x: cardEntry.offset)
                        .gesture(DragGesture(minimumDistance: 0)
                                    .onChanged({ (value) in
                                        onChanged(value: value, index: index)
                                    })
                                    .onEnded({ (value) in
                                        onEnded(value: value, index: index)
                                    })
                        )
                    }
                }
               
                Button(action: {
                    for index in movieViewModel.movies.indices {
                        movieViewModel.movies[index].offset = 0
                    }
                } ) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.blue)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(radius: 3)
                }.padding(.top, 35)
            }
        }
        .padding()
        .onAppear {
            self.network.fetchDataFromNetwork { (movies) in
                for movie in movies.results {
                    movieViewModel.movies.append(MovieCard(id: UUID(), title: movie.title, overview: movie.overview, imageLink: movie.backdropPath, status: true))
                }
            }
        }
    }
    
    func getWidth(for index: Int) -> CGFloat {
        let width = UIScreen.main.bounds.width - 100
        //cardViewModel.swipeCard is required to next set of the cards to visible position
        let cardWidth = index + movieViewModel.swipedCard >= 1 ?  CGFloat(index * -10): -10
        return width - cardWidth
    }
    
    func getCardOffset(for index: Int) -> CGFloat {
        //cardViewModel.swipeCard is required to offset next set of the cards to visible position
        return index + movieViewModel.swipedCard >= 1 ? -CGFloat(index  * 10) : -10
    }
    
    func getRotation(for index: Int) -> Double {
        let height = Double(200)
        let offset = Double(movieViewModel.movies[index].offset)
        let angle : Double = 15
        return (offset/height) * angle
    }
    
    func onChanged(value: DragGesture.Value, index: Int) {
        withAnimation(Animation.easeIn(duration: 0.2)) {
            movieViewModel.movies[index].offset = value.translation.width * 10
        }
//        if width < 0 {
//            // left swipe
//            withAnimation(Animation.spring()) {
//                cardViewModel.cards[index].offset = value.translation.width * 20
//            }
//        } else if width > 0 {
//            // right Swipe
//            withAnimation(Animation.spring()) {
//                cardViewModel.cards[index].offset = value.translation.width * 20
//            }
//        }
    }
    
    func onEnded(value: DragGesture.Value, index: Int) {
        withAnimation {
            if value.translation.width > 20 {
                // move the card to the right
                movieViewModel.movies[index].offset = width
                movieViewModel.swipedCard += 1
            } else if value.translation.width < -20  {
                // move the card to left
                movieViewModel.movies[index].offset = -width
                movieViewModel.swipedCard += 1
            } else {
                movieViewModel.movies[index].offset = 0
            }
        }
    }
}

@available(iOS 14.0, *)
struct VerticalCarouselTemplateView_Previews: PreviewProvider {
    static var previews: some View {
        VerticalCarouselTemplateView()
    }
}
