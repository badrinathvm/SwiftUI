//
//  form.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/2/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct SectionTextAndImage: View {
    var name: String
    var image: String
    
    var body: some View {
        HStack{
            Image(systemName: image).padding(.trailing, 2) // adds padding towards the right of the image
            Text(name).padding(.top, 5) // adds padding at the top of the text
        }
        .font(.body)
        .foregroundColor(Color.purple)
    }
}

struct Forms: View  {
    var body: some View {
        Form {
            Section {
                Text("This is a Form!")
                    .font(.title)
                Text("You can put any content here")
                Text("The cells will grow to fir the content,Remeber it's just views inside of views")
            }
            
            Section {
                Text("Limitations").font(.title)
                Text("There are built-in margins that are diffuclut to get around. Take a look at the color below so you can see where the margins are")
                Color.purple
                Text("You can use the List RowInset modifier to adjust the margins")
                Color.purple
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
            
            Section(header: Text("Section With header")) {
                Text("You can add any view in a section header,Notice the default foreground color is gray")
            }

            //adds image /text to header , changes the background color of the list
            Section(header: SectionTextAndImage(name: "People", image: "person.2.square.stack.fill")) {
                Text("Example for Section with image and text")
            }.listRowBackground(Color.purple)
                .foregroundColor(Color.white)
            
            Section(header: Text("Row Inset Uses")
                            .font(.body)
                            .foregroundColor(Color.gray)) {
                    Text("Indent Level 1")
                        .listRowInsets(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 0))
                    Text("Indent Level 2")
                        .listRowInsets(EdgeInsets(top: 0, leading: 80, bottom: 0, trailing: 0))
                    Text("Vertical Alignment")
                    Text("Top")
                        .listRowInsets(EdgeInsets(top: -20, leading: 40, bottom: 0, trailing: 0))
                    Text("Bottom")
                    .listRowInsets(EdgeInsets(top: 20, leading: 40, bottom: 0, trailing: 0))
            }
            
            Section(header: Text(""), footer: Text("Total is $5,60,000").bold()) {
                Text("Here is an example for section footer")
            }
        }
    }
}
