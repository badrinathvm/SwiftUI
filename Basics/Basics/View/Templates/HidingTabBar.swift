//
//  HidingTabBar.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 1/3/21.
//  Copyright © 2021 Badarinath Venkatnarayansetty. All rights reserved.
//

import SwiftUI

struct BaseNavigationView<Content>: View where Content: View {
    @ObservedObject var model: BaseNavigationModel
    var content: () -> Content
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .center) {
                    self.content()
                    if self.model.mainView != nil {
                        self.model.mainView
                    }
                }
            }
            .background(Color.white)
        }
    }
}

class BaseNavigationModel: ObservableObject {
    @Published var isPushActive: Bool = false
    @Published private(set) var mainView: AnyView?
    public func pushMain<Main: View>(view: Main) {
        // First pop if any other view has been pushed
        isPushActive = false
        let container = PushContainer(content: view)
        self.mainView = AnyView(container)
        // Push view
        isPushActive = true
    }
}

struct PushContainer<Content: View> : View {
    let main: AnyView
    var body: some View {
        GeometryReader { proxy in
            self.generateBody(proxy: proxy)
        }.animation(.default)
    }
    init(content: Content) {
        self.main = AnyView.init(content)
    }
    func generateBody(proxy: GeometryProxy) -> some View {
        return ZStack {
            self.main
        }
    }
}



struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier( HiddenNavigationBar() )
    }
}
