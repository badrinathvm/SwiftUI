//
//  CombineAsync.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/13/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import Combine
import SwiftUI



struct CombineAsync: View  {
    var combineAsync = DataSource()
    var body: some View {
        
        return VStack {
             Text("Hello Async Combine")
        }
    }
}


enum RequestError: Error {
    case sessionError(error: Error)
}

class DataSource: ObservableObject {
    
   let URLPublisher = PassthroughSubject<URL, RequestError>()
    
    init() {
        let subscription = URLPublisher.flatMap { requestUrl in
                URLSession.shared
                .dataTaskPublisher(for: requestUrl)
                .mapError { (error) -> RequestError in
                        RequestError.sessionError(error: error)
                }
            }
            .assertNoFailure()
            .receive(on: RunLoop.main)
            .sink { result in
                print("Request Finished \(result.data)")
            }
        
        //URLPublisher.send(URL(string: "https://httpbin.org/image/jpeg")!)
         URLPublisher.send(URL(string: "https://gist.githubusercontent.com/badrinathvm/8f5485b6cf3f7f939261d9eb280c2583/raw/7b12b52736865dbe27cc0ffa31f89b4834914c9d/sample.json")!)
    }
}
