//
//  Day26.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 10/31/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

struct Day26: View {
    @State private var sleepAmount = 8.0
    @State private var wakeup = defaultWakeTime
    @State private var coffeeAmount = 1
    var body: some View {
//        VStack {
//            // in - > Range,  step - Increments  %g -> removes significant zeros
//            Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
//                Text("\(sleepAmount, specifier: "%g") hours")
//            }
//
//            //Enclosing in Form provides inline expansion
//            //To hide label use .labelHidden() modifier
//            // Also provides single sided range property for eg: Date()...
//            Form {
//                DatePicker(selection: $wakeup, displayedComponents: .hourAndMinute) {
//                    Text("Please Enter a Date")
//                }
//            }
//        }
        
        
        NavigationView {
            Form {
                VStack(alignment: .leading, spacing: 0) {
                    Text("When do you want to wake up ?")
                    
                    DatePicker("Please Select Date", selection: $wakeup , displayedComponents: .hourAndMinute).labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Desired Amount of Sleep")
                        .font(.headline)
                    
                    Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                        Text("\(sleepAmount, specifier: "%g") hours")
                    }
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Daily Coffee Intake")
                        .font(.headline)
                    
                    Stepper(value: $coffeeAmount, in: 1...20) {
                        if coffeeAmount == 1 {
                            Text("1 cup")
                        }else {
                            Text("\(coffeeAmount) cups")
                        }
                    }
                }
               
            }.navigationBarTitle("Better Rest")
            .navigationBarItems(trailing:
                Button(action: calculateBedtime) {
                    Text("Calculate")
                }
            )
        }
    }
    
    func calculateBedtime() {
        print("Calculating Bed Time")
    }
    
    static var defaultWakeTime:Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 30
        return Calendar.current.date(from: components) ?? Date()
    }
}

struct Day26_Previews: PreviewProvider {
    static var previews: some View {
        Day26()
    }
}
