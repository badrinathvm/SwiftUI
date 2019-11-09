//
//  Lists.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/2/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

// Key points :  id is required to uniquely identiufy each row which can be helpful while re ordering m, deleting rows for us.

struct CustomRow: View  {
    var content: String
    var body: some View {
        HStack { // is optional , implicitly it will HStack for a row.
            Image(systemName: "person.circle.fill").foregroundColor(Color.red).padding(.trailing , 10)
            Text("\(content)")
                .font(content == "Grouped List Style" ? Font.largeTitle : Font.body)
                .foregroundColor(Color.black)
            Spacer()
            Image(systemName: self.content == "Lists" ? "circle.fill" : "circle" )
                .foregroundColor(Color.red)
        }
        .font(.title)
        .padding([.top, .bottom])
    }
}


struct Lists: View  {
    var stringArray = ["This is the simplest list", "Swift" , "SwiftUI" , "Property Wrappers", "Forms", "Stepper" , "Lists" , "Gradients"]
    @State var todo = ["Swipe top Delete", "Practice Coding", "Grocery Shopping" , "Watch Movie", "Clean House" , "Laundry"]
    
    var body: some View {
        VStack {
            List(stringArray, id: \.self) { value in
                CustomRow(content: value)
            }
            .listStyle(GroupedListStyle())
            
            Spacer()
            // OnDelete , onMove OnInsert works only on dynamic content protocol , simple trcik is to loop the list items inside FoEach.
            List {
                Section(header: Text("To Do")) {
                    ForEach(todo, id: \.self) {value in
                        Text(value)
                           .foregroundColor(Color.black)
                            .font(.body)
                    }.onDelete(perform: delete) // enables Swipe to delete
                }
            }
            .listStyle(GroupedListStyle())
        }
    }
    
    func delete(at indexes: IndexSet) {
        if let index = indexes.first {
            todo.remove(at: index)
        }
    }
}
