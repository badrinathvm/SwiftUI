//
//  SampleView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/2/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct CustomModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.padding()
               .foregroundColor(Color.white)
    }
}

struct LanguageView: View {
    var language:String
    var body: some View {
        HStack {
            Text(language).foregroundColor(Color.black)
            Image(systemName: "checkmark.seal.fill").foregroundColor(Color.green)
            Spacer()
            Image(systemName: "chevron.right.circle.fill").foregroundColor(Color.pink)
        }
        .font(.system(size: 24, design: .rounded))
        .padding().background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 2, y: 0)
    }
}


struct ScrollViews: View {
    
    @State var languages = ["Swift" , "Kotlin" , "Scala" , "R" ,"JavaScript" , "Java" , "Objective-C", "Python" , "Ruby", "Shell" , "Matlab"]
    
    var body : some View {
        NavigationView {
            GeometryReader { gr in
                ScrollView(Axis.Set.vertical, showsIndicators: false) {
                    ForEach(self.languages, id: \.self) { value in
                        NavigationLink(destination: DetailView()) {
                           LanguageView(language: value)
                        }
                    }.onMove(perform: self.moveItems)
                }
                .frame(width: gr.size.width - 32)
            }
            .navigationBarTitle(Text("Cool Languages"))
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    func moveItems(from indexes: IndexSet, at destination : Int) {
        guard let index = indexes.first else { return }
        languages.insert(languages.remove(at: index), at: destination)
    }
}
