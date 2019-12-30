//
//  SceneDelegate.swift
//  Basics
//
//  Created by Badarinath Venkatnarayansetty on 10/12/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Use a UIHostingController as window root view controller
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            //window.rootViewController = UIHostingController(rootView: ContentView())
             //window.rootViewController = UIHostingController(rootView: TipView())
            
             //window.rootViewController = UIHostingController(rootView: Containers())
             //window.rootViewController = UIHostingController(rootView: BasicTemplate())
             //window.rootViewController = UIHostingController(rootView: ViewSizesPullsIn())
             //window.rootViewController = UIHostingController(rootView: ViewSizesPushOut())
            //window.rootViewController = UIHostingController(rootView: VHZstacks())
            //window.rootViewController = UIHostingController(rootView: GReader())
             //window.rootViewController = UIHostingController(rootView: Buttons())
            //.window.rootViewController = UIHostingController(rootView: Forms())
            //window.rootViewController = UIHostingController(rootView: Lists())
             //window.rootViewController = UIHostingController(rootView: ListsMove())
            //window.rootViewController = UIHostingController(rootView: ListRowBackground())
            //window.rootViewController = UIHostingController(rootView: NavigationViews())
            //window.rootViewController = UIHostingController(rootView: ScrollVerticalView())
            //window.rootViewController = UIHostingController(rootView: YosemiteView())
            //window.rootViewController = UIHostingController(rootView: ScrollHorizontalView())
            //window.rootViewController = UIHostingController(rootView: SegmentControlView())
            //window.rootViewController = UIHostingController(rootView: SliderStepperView())
            //window.rootViewController = UIHostingController(rootView: TabViews())
             //window.rootViewController = UIHostingController(rootView: PizzaView())
            //window.rootViewController = UIHostingController(rootView: CircularShapes())
            //window.rootViewController = UIHostingController(rootView: CircleBorder())
            //window.rootViewController = UIHostingController(rootView: CircleTrim())
            //window.rootViewController = UIHostingController(rootView: AngularGradientView())
            //window.rootViewController = UIHostingController(rootView: LinearGradientView())
            //window.rootViewController = UIHostingController(rootView: RadialGradientView())
            //window.rootViewController = UIHostingController(rootView: SheetView())
            //window.rootViewController = UIHostingController(rootView: SheetViewIDentifiable())
            //window.rootViewController = UIHostingController(rootView: ProgressRowView())
            //window.rootViewController = UIHostingController(rootView: ScaleEffectView())
            //window.rootViewController = UIHostingController(rootView: ShadowView())
            //window.rootViewController = UIHostingController(rootView: TransalationView())
            //window.rootViewController = UIHostingController(rootView: RotationalEffectView())
            //window.rootViewController = UIHostingController(rootView: Offsetview())
            //window.rootViewController = UIHostingController(rootView: BlendModeView())
            //window.rootViewController = UIHostingController(rootView: CustomPopupView())
            //window.rootViewController = UIHostingController(rootView: EdgesIgnoringInsetView())
            //window.rootViewController = UIHostingController(rootView: ClippedView())
            //window.rootViewController = UIHostingController(rootView: ButtonStyleView())
            //window.rootViewController = UIHostingController(rootView: CheckBoxView())
             //window.rootViewController = UIHostingController(rootView: ToggleReConstructionView())
            //window.rootViewController = UIHostingController(rootView: CombineEssentialsView())
            //window.rootViewController = UIHostingController(rootView: CombineMapStreamView())
             //window.rootViewController = UIHostingController(rootView: OperationListView())
             //window.rootViewController = UIHostingController(rootView: BarAnimationView())
             //window.rootViewController = UIHostingController(rootView: CombineAsync())
             //window.rootViewController = UIHostingController(rootView: CreditScoreView())
             //window.rootViewController = UIHostingController(rootView: GeometryView())
             //window.rootViewController = UIHostingController(rootView: BudgetsView())
             //window.rootViewController = UIHostingController(rootView: CardBottomView())
            //window.rootViewController = ViewController()
            //window.rootViewController = UIHostingController(rootView: MenuView())
            //window.rootViewController = UIHostingController(rootView: PublishedView())
              //window.rootViewController = UIHostingController(rootView: UpperCasedView())
             //window.rootViewController = UIHostingController(rootView: AnimationView())
            window.rootViewController = UIHostingController(rootView: SequenceAnimationView())
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

