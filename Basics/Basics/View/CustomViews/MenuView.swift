//
//  MenuView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/18/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

var menuItems = ["Account" , "Billing" , "Settings"]

struct MenuItemView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            ForEach(menuItems, id: \.self) {
                Text($0)
                    .padding()
                    .font(.system(size: 20, weight: .regular))
                    .foregroundColor(Color.black)
            }
            Spacer()
        }
    }
}

struct MenuView : View {
    @State private var showMenu = false
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        self.showMenu.toggle()
                    }) {
                        Image(systemName: "gift.fill" )
                            .padding()
                            .frame(width: 60)
                    }
                }
                //in order to get the buttin to top corner.
                Spacer()
            }
            //passing the state to child view whther to show or not.
            ShowMenu(show: $showMenu)
        }
    }
}

struct ShowMenu: View {
    @Binding var show:Bool
    var body: some View {
        ZStack {
            HStack {
                MenuItemView()
                    .foregroundColor(Color.white)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 300)
                            .shadow(radius: 2, y: 2)
                            .foregroundColor(Color.white)
                            )
                Spacer()
            }
        }.offset(x: self.show ? 0 : -600)
            .onTapGesture {
                self.show.toggle()
        }.animation(.spring())
    }
}
