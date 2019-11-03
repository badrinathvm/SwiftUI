//
//  SampleView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/3/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct YosemiteView: View  {
    var body: some View {
        ZStack {
            BackgroundImageView()
            VStack {
                MenuButtonView()
                WelcomeTextView()
                Spacer()
                SignInButtonView()
                Spacer()
                BottomSheetView()
            }
        }
    }
}

struct BackgroundImageView: View {
    var body: some View  {
        Image("y1")
            .resizable()
            .scaledToFill()
            .clipped()
            .frame(width: UIScreen.main.bounds.width)
            .edgesIgnoringSafeArea([.top,.bottom])
    }
}

struct MenuButtonView: View {
    var body: some View {
        HStack {
            Button(action : {}) {
                Image(systemName: "bell.fill")
                    .foregroundColor(Color.white)
            }
            Spacer()
        }.padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 0))
    }
}

struct WelcomeTextView: View {
    var body: some View {
        VStack {
            Text("Yosemite")
                .font(.title).bold()
            Text("Yosemite Valley, to me, is always a sunrise, a glitter of green and golden wonder in a vast edifice of stone and space.")
                .frame(maxWidth: .infinity)
                .padding()
                .font(.system(size: 14, weight: Font.Weight.medium))
                .layoutPriority(1)
        }.padding(.top, 100)
            .foregroundColor(Color.white)
    }
}

struct SignInButtonView: View  {
    var body: some View  {
        Button(action : {}) {
            HStack {
                Image(systemName: "lock.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .padding(EdgeInsets(top: 10, leading:20, bottom: 10, trailing: 10))
                    .foregroundColor(Color.green)
                VStack(alignment: .leading) {
                    Text("Lets Explore Hiking Spots")
                        .foregroundColor(Color.black)
                        .padding(.bottom, 4)
                        .font(.system(size: 14, weight: Font.Weight.heavy))
                    Text("Signin to create an account")
                        .foregroundColor(.secondary)
                        .font(.system(size: 14, weight: Font.Weight.light))
                }
                Spacer()
            }
        }.background(RoundedRectangle(cornerRadius: 18)
            .foregroundColor(Color.white)
            .padding(.horizontal , 8))
    }
}

struct BottomSheetView: View {
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("Find a Hike")
                        .padding(EdgeInsets(top: 20, leading: 25, bottom: 2, trailing: 10))
                        .font(.system(size: 24, weight: Font.Weight.bold))
                        .foregroundColor(Color.black)
                    Text("Start by choosing hike")
                        .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 10))
                        .font(.system(size: 12, weight: Font.Weight.regular))
                        .foregroundColor(Color.black)
                }.padding(.top , 30)
                
                Spacer()
                
                HStack {
                    Button(action: {}) {
                        Text("Start")
                            .padding()
                    }.padding([.leading,.trailing], 20)
                        .foregroundColor(Color.white)
                        .background(Color.green)
                        .cornerRadius(.infinity)
                }.padding(EdgeInsets(top: 40, leading: 10, bottom: 0, trailing: 30))
            }
            
            HStack {
                Button(action: {} ){
                    HStack {
                        Image(systemName: "clock.fill")
                            .foregroundColor(Color.green)
                        Text("History")
                            .font(.system(size: 14, weight: Font.Weight.bold))
                            .foregroundColor(Color.black)
                    }.padding(EdgeInsets(top: 15, leading: 40, bottom: 15, trailing: 40))
                }.background(RoundedRectangle(cornerRadius: 14)
                    .stroke(Color.gray, lineWidth: 1.0)
                    .shadow(radius: 2))
                
                Spacer()
                
                Button(action: {} ){
                    HStack {
                        Image(systemName: "gear")
                            .foregroundColor(Color.green)
                        Text("Menu")
                            .font(.system(size: 14, weight: Font.Weight.bold))
                            .foregroundColor(Color.black)
                    }.padding(EdgeInsets(top: 15, leading: 40, bottom: 15, trailing: 40))
                }.background(RoundedRectangle(cornerRadius: 14)
                    .stroke(Color.gray, lineWidth: 1.0)
                    .shadow(radius: 2))
            }.padding([.top,.leading,.bottom, .trailing], 25)
            
        }.background(RoundedRectangle(cornerRadius: 14)
            .foregroundColor(Color.white)
            .padding([.leading, .trailing] , 10))
    }
}
