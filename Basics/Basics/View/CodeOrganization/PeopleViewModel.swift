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
    
    @Published var people = [People(name: "SwiftUI", occupation: "Swifter")]
}
