//
//  CombineExamples.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/19/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

let subject = PassthroughSubject<String, Never>()

class Subject : ObservableObject {
    
    @Published var value: String = ""

    init() {
        let _ = subject.receive(on: RunLoop.main).sink { (val) in
                   print("Value Recieved is \(val)")
        }
        
        subject.send("Hello !")
    }
}

//struct CombineExamplesView : View {
//
//    var subject  = Subject()
//
//    var body: some View {
//        let publisher = Just("Here we go")
//        publisher.subscribe(subject)
//        Text("Hello")
//    }
//}
