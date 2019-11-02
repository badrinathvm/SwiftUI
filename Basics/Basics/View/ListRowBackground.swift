//
//  ListRowBackground.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/2/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct SectionHeader: View {
    @State private var newToDo = ""
    var width:CGFloat
    var body: some View {
        VStack {
            Text("To Do").font(.title).foregroundColor(Color.white)
            HStack {
                TextField("New To do ", text: $newToDo)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                        .foregroundColor(Color.white)
                }
            }
        }
        .padding(EdgeInsets(top: 50, leading: 26, bottom: 16, trailing: 16))
        .background(Color.green)
        .frame(width: width)
    }
}

struct ToDo {
    let id = UUID()
    var action = ""
    var due = ""
    var isIndeneted = false
}

struct ListRowBackground: View {
    
    @State var data = [
          ToDo(action: "Practice code", due: "Today", isIndeneted: false),
          ToDo(action: "Laundey", due: "Today", isIndeneted: false),
          ToDo(action: "Vegetables", due: "Today", isIndeneted: true),
          ToDo(action: "Cook Dinner", due: "Today", isIndeneted: true),
          ToDo(action: "Watch Movie", due: "Today", isIndeneted: false),
          ToDo(action: "Shopping", due: "Today", isIndeneted: false)]
    
    var body: some View {
        GeometryReader { gr in
            List {
                Section(header: SectionHeader(width: gr.size.width)) {
                    ForEach(self.data, id:\.self.id) { value in
                        Text(value.action)
                            .font(.body)
                            .foregroundColor(Color.white)
                            .padding()
                            .listRowInsets(EdgeInsets(top: 0, leading: value.isIndeneted ? 60: 20, bottom: 0, trailing: 0))
                    }
                }
            }
            .preferredColorScheme(ColorScheme.dark)
            .listStyle(GroupedListStyle())
        }.edgesIgnoringSafeArea(Edge.Set.top)
    }
}
