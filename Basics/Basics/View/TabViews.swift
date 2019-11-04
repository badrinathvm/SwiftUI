//
//  TabViews.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/3/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct TabOne: View {
    var body: some View {
        Text("Tab One View")
    }
}

struct TabTwo: View {
    var body: some View {
        Text("Tab two View")
    }
}

struct TabViews: View  {
    var body: some View {
        TabView {
            TabOne().tabItem {
                Text("Tab1")
            }
            TabTwo().tabItem {
                //tab name or image
                Text("Tab 2")
            }
            //tab content followed by
            Text("Phone Calls").tabItem {
                //tab name and image
                Image(systemName: "phone")
            }
            
            Text("Outgoign Phone Calls").tabItem {
                Image(systemName: "phone.arrow.up.right")
                Text("Outgoing")
            }
            
            Text("Phone Book Screen").tabItem {
                Image(systemName: "book")
                Text("Phone Book")
            }
            
            Text("History").tabItem {
                Image(systemName: "clock")
                Text("History")
            }
            
            Text("New Phone Number").tabItem {
                Image(systemName: "phone.badge.plus")
                Text("New")
            }
        }
    }
}
