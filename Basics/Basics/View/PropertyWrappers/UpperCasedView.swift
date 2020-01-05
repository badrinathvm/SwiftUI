//
//  UpperCasedView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/19/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI

struct UserName {
    @UpperCased var username:String
}

struct UpperCasedView: View {
    let user = UserName(username: "swiftui")
    var body: some View {
        VStack(spacing: 20){
            Text("\(user.username)")
            Text("Poperty wrapper \(UserPreferences.isSwiftUIEnabled)")
        }.font(.system(size: 24, weight: .black))
    }
}

//create a new property wrapper
@propertyWrapper
struct UpperCased {
    var text:String
    
    //should provide warppedValue implementation for every new property wrapper created.
    var wrappedValue:String {
        get { text.uppercased() }
        set { text = newValue }
    }
    
    // this initilazer gets called for tht first time.
    init(wrappedValue: String) {
        self.text = wrappedValue
    }
}

@propertyWrapper
struct UserDefault<T> {
    var key:String
    var initialValue: T
    var wrappedValue:T {
        set { UserDefaults.standard.set(newValue , forKey: key)}
        get { UserDefaults.standard.object(forKey: key) as? T ?? initialValue }
    }
}

enum UserPreferences {
    @UserDefault(key: "isSwiftUIEnabled", initialValue: "YES") static var isSwiftUIEnabled:String
}

