//
//  ContentView.swift
//  Basics
//
//  Created by Badarinath Venkatnarayansetty on 10/12/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

// View is a protocol ,comes from SWiftUI must be adopted to draw anything on the screen
// View protocol needs to have a mandate computed `body` property returns some view.
struct ContentView : View {
    // Returns some thing that conforms to view protocol
    // some: It must always be the same kind of view being returned.
    var body: some View {
        // adding a navigation view.
        NavigationView {
            // scrolling list of static controls
            Form {
                //Segregates in to sections just like table view sections
                Section {
                    Text("Hello Swift")
                }
                
                Group{
                    Text("iOS")
                    Text("macOS")
                    Text("tvOS")
                    Text("watchOS")
                }
            }
            //make sure navigation view components should be added inside the block not outside.
            .navigationBarTitle(Text("SwiftUI") , displayMode: .inline)
        }
      
    }
}

#if DEBUG
// Conforms to PreviewProvider protocol to provides mock testing and dont need to part of final app.
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
