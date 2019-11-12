//
//  File.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/11/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct Task: Identifiable {
    var id: Int
    var taskName: String
}

struct CombineEssentialsView: View {
    var tasks = [Task(id: 0, taskName: "Read More"), Task(id: 1, taskName: "Practiced Simulator")]
    
    @State private var createAccountButtonDisabled : Bool = false
    
    //States need to be handled via model
    @ObservedObject var toggleModel = ToggleModel()
    
    @State var cancellable: AnyCancellable?
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(tasks) { task in
                Toggle(isOn: task.id == 0 ?  self.$toggleModel.readTask: self.$toggleModel.practiceTask ) {
                    Text("\(task.taskName)").font(.body)
                }.padding(.horizontal, 10)
            }

            Button(action: {}) {
                Text("Create Account")
            }.disabled(!self.$createAccountButtonDisabled.wrappedValue)
                .onReceive(self.toggleModel.validatedTasks) { (publisher) in
                    self.createAccountButtonDisabled = (publisher.0 && publisher.1)
            }
        }
    }
}

class ToggleModel: ObservableObject {
    
    @Published var readTask: Bool = false
    @Published var practiceTask: Bool = false
            
    var validateRead: AnyPublisher<Bool, Never> {
        return $readTask
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    var validatePractice: AnyPublisher<Bool, Never> {
        return $practiceTask
             .debounce(for: 0.5, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    var validatedTasks: AnyPublisher<(Bool,Bool), Never> {
        return Publishers.CombineLatest(validateRead,validatePractice)
                .receive(on: RunLoop.main)
         .eraseToAnyPublisher()
    }
}
