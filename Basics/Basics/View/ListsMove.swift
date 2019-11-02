//
//  ListsMove.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/2/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct ListsMove: View  {
    @State var data = ["Clean House" , "Laundry" , "Parctice Coding" , "Watch Movie" , "Get Tickets", "Cook Dinner" , "Grocery Shopping"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(data, id:\.self) { value in
                    Text(value)
                        .padding()
                        .font(.body)
                        .foregroundColor(Color.white)
                }.onMove(perform: moveRow)
                }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("To Do")
            .navigationBarItems(trailing: EditButton().font(.headline)) // Edit button automatically toggles preparing rows to mobe
            .preferredColorScheme(ColorScheme.dark)
        }.accentColor(Color.red) // change the color of the button
    }
    
    func moveRow(from indexes: IndexSet, to destination: Int) {
        guard let index  = indexes.first else  { return }
        data.insert(data.remove(at: index), at: destination)
    }
}
