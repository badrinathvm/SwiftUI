//
//  TabViewTemplate.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 12/25/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

// Note : Make use of environmentObject if we wanna avoid Bindign nesting
class Overlay: ObservableObject {
    @Published var show: Bool = false
    @Published var overlayContent:CategoryData = CategoryData(index: 0, title: "", sections: [])
}

@available(iOS 14.0 , *)
struct TabViewTemplateView: View {
    @StateObject var overlay = Overlay()
    var body: some View {
        ZStack {
            TabView {
                ListView()
                    .environmentObject(overlay)
                .tabItem {
                    VStack {
                        Image(systemName: "rectangle.expand.vertical")
                        Text("Expand")
                    }
                }
                
                ListScaleEffectView()
                    .tabItem {
                        VStack {
                            Image(systemName: "list.dash")
                            Text("List")
                        }
                    }
            }
            
            if overlay.show {
                ZStack {
                    Color.black.opacity(0.2).edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                           // withAnimation(Animation.default) {
                                overlay.show.toggle()
                            //}
                        }
                    OverlayContentView(selectedCategoryData: overlay.overlayContent)
                }
            }
        }
    }
}

@available(iOS 14.0 , *)
struct ListView:View {
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button(action: {

                    }) {
                        Image(systemName: "line.horizontal.3")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color.black)
                    }

                    Spacer(minLength: 0)

                    Button(action: {}) {
                        Image(systemName: "bell.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.black)
                    }
                }
                Text("List")
                    .foregroundColor(Color.black)
            }
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .padding()
            .overlay(Rectangle().stroke(Color.black.opacity(0.05),lineWidth: 2))

            ExpandableListView()
        }.edgesIgnoringSafeArea(.top)
    }
}

@available(iOS 14.0 , *)
struct TabViewTemplateView_Previews: PreviewProvider {
    static var previews: some View {
        TabViewTemplateView()
    }
}
