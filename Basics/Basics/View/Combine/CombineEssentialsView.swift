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

struct CombineEssentialsView: View {
    @State private var createAccountButtonDisabled : Bool = false
    @State private var buttonBackGround:Color = Color.gray
    
    //States need to be handled via model
    @ObservedObject var toggleModel = ToggleModel()
    
    @State var cancellable: AnyCancellable?
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Toggle(isOn: self.$toggleModel.readTask) {
                    Text("Read Manual").font(.system(size: 16, weight: Font.Weight.bold))
                }.padding(.horizontal , 10).padding(.top, 10)
                
                Toggle(isOn: self.$toggleModel.practiceTask) {
                    Text("Practiced in Simulator").font(.system(size: 16, weight: Font.Weight.bold))
                }.padding(.horizontal , 10).padding(.top, 10)
                
                Toggle(isOn: self.$toggleModel.teacherApproved) {
                    Text("Teacher Approved").font(.system(size: 16, weight: Font.Weight.bold))
                }.padding(.horizontal , 10).padding(.top, 10)
                
                Button(action: {}) {
                    Text("Create Account")
                        .foregroundColor(Color.white)
                }.padding()
                    .background(RoundedRectangle(cornerRadius: 20).foregroundColor(buttonBackGround))
                    .disabled(!self.$createAccountButtonDisabled.wrappedValue)
                    .onReceive(self.toggleModel.validatedTasks) { (publisher) in
                        self.createAccountButtonDisabled = (publisher.0 && publisher.1 && publisher.2)
                        self.buttonBackGround = (publisher.0 && publisher.1 && publisher.2) ? Color.blue : Color.gray
                }
                
                Spacer()
            }.navigationBarTitle("Terms & Conditions")
        }
    }
}

class ToggleModel: ObservableObject {
    
    @Published var readTask: Bool = false
    @Published var practiceTask: Bool = false
    @Published var teacherApproved: Bool = false
            
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
    
    var validateTeacherApproved: AnyPublisher<Bool, Never> {
        return $teacherApproved
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    var validatedTasks: AnyPublisher<(Bool,Bool,Bool), Never> {
        return Publishers.CombineLatest3(validateRead,validatePractice,validateTeacherApproved)
                .receive(on: RunLoop.main)
         .eraseToAnyPublisher()
    }
}
