//
//  Daay29.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 10/31/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

struct Day29: View {
     let people = ["AA", "BB", "CC"]
    var body: some View {
//        List {
//            Section(header: Text("Section 1")) {
//                Text("Statuc List 1")
//                Text("Static List 2")
//            }
//
//            Section(header: Text("Section 2")) {
//                ForEach(0..<3) { value  in
//                    Text("Dynamic List \(value)")
//                }
//            }
//
//            Section(header: Text("Section 3")) {
//                Text("Static List 1")
//                Text("Static List 2")
//            }
//        }.listStyle(GroupedListStyle())
        
       
//        List(people , id: \.self) { value in
//            Text("\(value)")
//        }.listStyle(GroupedListStyle())
        
       // or
        
        List {
            ForEach(people, id: \.self) {
                Text($0)
            }
        }.listStyle(GroupedListStyle())
    }
}

struct Daay29_Previews: PreviewProvider {
    static var previews: some View {
        Day29()
    }
}
