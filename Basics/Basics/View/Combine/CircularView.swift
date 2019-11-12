//
//  CircularView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/11/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct CircularTextView: View {
    // Here we are jsut displaying the value, so no need of Binding
    var value: String
    var body: some View {
        VStack {
            Text(value)
                .foregroundColor(Color.white)
                .padding()
                .background(Color.green)
                .clipShape(Circle())
                .shadow(radius: 1)
        }
    }
}

struct TunnelView: View {
    //derived from State from the parent view , since we are using streamValues to loop over it we have declared it as Binding.
    @Binding var streamValues: [String]
    
    let verticalPadding: CGFloat = 5
    
    let tunnelColor: Color = Color(red: 242/255.0, green: 242/255.0, blue: 242/255.0)
    
    var body: some View {
        HStack(spacing: verticalPadding) {
            ForEach(streamValues.reversed(), id: \.self) { value in
                CircularTextView(value: value)
            }
        }.padding([.vertical,.horizontal] , 15)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .background(tunnelColor)
    }
}

struct StreamView: View {
    //Source of truth
    @State var streamValues: [String] = []

    @State var nextValue = 0

    var body: some View {
        VStack {
            TunnelView(streamValues: $streamValues)
            HStack {
                Button("Add", action: {
                    self.nextValue += 1
                    self.streamValues.append(String(self.nextValue))
                })

                Button("Remove", action: {
                    self.streamValues.remove(at: 0)
                })
            }
        }
    }
}

// Let's Combine it

struct CombinedStreamView: View {
    @State var streamValues: [String] = []
    
    @State var cancellable: AnyCancellable?
    
    var body: some View {
        VStack {
            Spacer()
            TunnelView(streamValues: $streamValues)
            
            HStack {
                Button("SubScribe",action: {
                    //it can be cancellable any time
                    self.cancellable?.cancel()
                    self.cancellable = self.anyPublisher().sink(receiveCompletion: { _ in
                        self.cancellable = nil
                    }, receiveValue: { (value) in
                        self.streamValues.append(String(value))
                    })
                })
                
                if self.cancellable != nil {
                    Button("Cancel", action: {
                        self.cancellable = nil
                    })
                } else {
                    Button("Clear", action: {
                        self.streamValues.removeAll()
                    })
                }
            }
            Spacer()
        }
    }
    
    /// there seems a lot going on in this method anyPublisher. Basically, all it does is to emits one value every second and reduces to single publisher to present it on tunnel.
    func anyPublisher() -> AnyPublisher<String, Never> {
       
        let publishers = (1...5).map { String($0) }
            .map { Just($0).delay(for: .seconds(1), scheduler: DispatchQueue.main)
            .eraseToAnyPublisher()
           }
        //reducing in to single publisher
        return publishers[1...].reduce(publishers[0] ,{ pub1, pub2 in
            Publishers.Concatenate(prefix: pub1, suffix: pub2).eraseToAnyPublisher()
        })
    }
}
