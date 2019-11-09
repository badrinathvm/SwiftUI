//
//  Pizza.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/7/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct Pizza {
    var name: PizzaName = .margherita
    var size:PizzaSize = .medium
    var crust: PizzaCrust = .standard
    
    var pizzaSelection: String {
        return "You have selected \(size.rawValue) \(name.rawValue.capitalized) pizza with \(crust.rawValue)"
    }
}

enum PizzaName: String, CaseIterable {
    case margherita , hawaiian, pepperoni, vergetarian , seafood , mushroom
}

enum PizzaSize: String, CaseIterable {
    case large , thin , medium
}

enum PizzaCrust: String, CaseIterable {
    case thin , standard , deeppan = "deeppan"
}

struct PizzaView: View {
    @State private var pizza = Pizza()
    
    var body: some View {
        NavigationView {
            Form {
                PizzaNamePicker(selectedPizzaName: $pizza.name)
            }
            .navigationBarTitle("Choose Your Pizza")
        }
    }
}

struct PizzaNamePicker: View {
    
    @Binding var selectedPizzaName: PizzaName
    
    var body: some View {
        Section(header: Text("Select Your Pizza"), content: {
            List(PizzaName.allCases, id:\.self) { value in
                Button(action: {self.selectedPizzaName = value}) {
                    HStack {
                        Text(value.rawValue)
                        Spacer()
                        Image(systemName: "checkmark")
                    }
                }
            }
        })
    }
}
