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
