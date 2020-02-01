//
//  PeopleView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 2/1/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct PeopleView: View {
    
    // An ObservableObject needs to be a class type and will update the View whenever the properties that are marked with @Published changes.
    @ObservedObject var viewModel = PeopleViewModel()
    
    var body: some View {
        VStack(alignment: .leading){
            ForEach(viewModel.people) { (people) in
                Text(people.name)
                Text(people.occupation)
            }
        }
    }
}
