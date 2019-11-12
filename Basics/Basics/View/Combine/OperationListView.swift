//
//  OperationListView.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/12/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct OperationListView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: GenericCombineStreamView(navigationBarTitle: "Map(.map { $0 * 2 })", comparingPublisher: self.mapPublisher)) {
                    Text("Map")
                }
                NavigationLink(destination: GenericCombineStreamView(navigationBarTitle: "Scan.scan(0) { $0 + $1 }", comparingPublisher: self.scanPublisher)) {
                    Text("Scan")
                }
                NavigationLink(destination: GenericCombineStreamView(navigationBarTitle: "Filter.filter { $0 != 2 }", comparingPublisher: self.filterPublisher)) {
                    Text("Filter")
                }
                NavigationLink(destination: GenericCombineStreamView(navigationBarTitle: "Drop.dropFirst(2)", comparingPublisher: self.dropPublisher)) {
                    Text("Drop")
                }
            }.navigationBarTitle("Combine Operators")
        }
    }
    
    func mapPublisher(publisher: AnyPublisher<String,Never>) -> AnyPublisher<String,Never> {
        publisher.map { (Int($0) ?? 0 ) * 2 }.map { String($0) }.eraseToAnyPublisher()
    }
    
    func scanPublisher(publisher: AnyPublisher<String, Never>) -> AnyPublisher<String, Never> {
        publisher.map { Int($0) ?? 0 }.scan(0) { $0 + $1 }.map { String($0) }.eraseToAnyPublisher()
    }
    
    func filterPublisher(publisher: AnyPublisher<String, Never>) -> AnyPublisher<String, Never> {
        publisher.filter { $0 != "2" }.eraseToAnyPublisher()
    }
    
    func dropPublisher(publisher: AnyPublisher<String, Never>) -> AnyPublisher<String, Never> {
        publisher.dropFirst(2).eraseToAnyPublisher()
    }
}

struct GenericCombineStreamView: View {
    @State private var streamValues1:[String] = []
    @State private var streamValues2:[String] = []
    @State private var disposables = Set<AnyCancellable>()
    
    var navigationBarTitle: String?
    var comparingPublisher: (AnyPublisher<String,Never>) -> (AnyPublisher<String, Never>)
    
    var body: some View {
        VStack(spacing : 0) {
            Spacer()
            TunnelView(streamValues: self.$streamValues1)
            TunnelView(streamValues: self.$streamValues2)
            
            HStack {
                Button("Subscribe", action: {
                    self.disposables.forEach {
                        $0.cancel()
                    }
                    let publisher = self.invervalValuePublisher()
                    publisher.sink { (value) in
                        self.streamValues1.append(value)
                    }.store(in: &self.disposables)
                    
                    let comparingPublisher = self.comparingPublisher(publisher)
                    comparingPublisher.sink { (value) in
                        self.streamValues2.append(value)
                    }.store(in: &self.disposables)
                })
                
                if self.disposables.count > 0 {
                    Button("Cancel") {
                        self.disposables.removeAll()
                    }
                } else {
                    Button("Clear") {
                        self.streamValues1.removeAll()
                        self.streamValues2.removeAll()
                    }
                }
            }
            
            Spacer()
        }
    }
    
    func invervalValuePublisher() -> AnyPublisher<String, Never> {
        let publishers = (1...5).map { String($0) }
            .map { Just($0).delay(for: .seconds(1), scheduler: DispatchQueue.main).eraseToAnyPublisher() }
        return publishers[1...].reduce(publishers[0]) {
            Publishers.Concatenate(prefix: $0, suffix: $1).eraseToAnyPublisher()
        }
    }
}
