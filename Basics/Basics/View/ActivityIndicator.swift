//
//  ActivityIndicator.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 3/30/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

// old school way
struct ActivityIndicator: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        UIActivityIndicatorView(style: .medium)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        uiView.startAnimating()
    }
}

//Enhanced way
struct Wrap<Wrapped: UIView>: UIViewRepresentable {
    typealias Updater = (Wrapped, Context) -> Void
    
    var makeView: () -> Wrapped
    var updateView: Updater
    
    init(_ makeView: @escaping @autoclosure ()-> Wrapped , updater updateView: @escaping Updater ) {
        self.makeView = makeView
        self.updateView = updateView
    }

    func makeUIView(context: Context) -> Wrapped {
        makeView()
    }
    
    func updateUIView(_ uiView: Wrapped, context: Context) {
        updateView(uiView, context)
    }
}


extension Wrap {
    init(_ makeView: @escaping @autoclosure () -> Wrapped,
         updater update: @escaping (Wrapped) -> Void) {
        self.makeView = makeView
        self.updateView = { view, _ in update(view) }
    }

    init(_ makeView: @escaping @autoclosure () -> Wrapped) {
        self.makeView = makeView
        self.updateView = { _, _ in }
    }
}

struct ActivityIndicatorView: View {
    //@ObservedObject var viewModel: ViewModel

    var body: some View {
        ZStack {
            Wrap(UIActivityIndicatorView()) {
                $0.startAnimating()
            }
            
//            Wrap(UIActivityIndicatorView(style: .large)) { (view, context) in
//                print(context)
//                view.startAnimating()
//            }
        }
    }
}
