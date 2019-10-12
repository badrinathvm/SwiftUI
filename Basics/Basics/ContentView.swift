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
        Text("Hello World")
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
