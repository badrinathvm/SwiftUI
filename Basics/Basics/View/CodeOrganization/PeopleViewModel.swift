//
//  PeopleViewModel.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 2/1/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation


final class PeopleViewModel: ObservableObject {
    
    struct People: Identifiable {
        var id: UUID = UUID()
        var name:String
        var occupation: String
    }
    
//    It’s a wrapper that can be used for properties that are declared in ObservableObject. Whenever the value changes, it will invoke objectWillChange method so View can react to the changes published.
    @Published var people = [People(name: "SwiftUI", occupation: "Swifter")]
}
