//
//  PublishedView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/18/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct PublishedView: View {
    //@State private var stateChnaged = true
        @State private var createAccountButtonDisabled : Bool = false
    @State private var buttonState = Color.gray
    
    @ObservedObject var task  = Task()
    
    var body: some View {
        VStack(spacing: 20) {
            Toggle(isOn: $task.toggleTask) {
                Text("Toggle Switch")
            }.padding(.horizontal)
            
            Button(action: {}){
                 Text("Button  Enabled").foregroundColor(Color.white)
                .padding()
                    .background(RoundedRectangle(cornerRadius: 20).foregroundColor(self.buttonState))
                
            }.padding()
                 .disabled(!$createAccountButtonDisabled.wrappedValue)
                .onReceive(self.task.validateToggleTask) { (publisher) in
                                self.createAccountButtonDisabled = publisher
                self.buttonState = publisher ? Color.blue : Color.gray
            }
            
            Button(action: {}) {
                Text("Create Account")
                    .foregroundColor(Color.white)
            }.padding()
                .background(RoundedRectangle(cornerRadius: 20).foregroundColor(buttonState))
                .disabled(!self.$createAccountButtonDisabled.wrappedValue)
                .onReceive(self.task.validateToggleTask) { (publisher) in
                    self.createAccountButtonDisabled = publisher
                    self.buttonState = (publisher) ? Color.blue : Color.gray
            }
        }
    }
}

class Task : ObservableObject {
    
    @Published var toggleTask:Bool = false
    
    var cancellable : AnyCancellable?
    
    var validateToggleTask: AnyPublisher<Bool, Never> {
         return $toggleTask
            .receive(on: DispatchQueue.main)
             .eraseToAnyPublisher()
     }
}
