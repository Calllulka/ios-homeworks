//
//  AppDelegate.swift
//  TestOne
//
//  Created by Alexander on 15.02.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var appCoordinator: AppCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let feedModel = FeedModel()
        let logInModel = LogInModel()
        let factory = AppFactory(logInModel: logInModel, feedModel: feedModel)
        let appCoordinator = AppCoordinator(factory: factory)
        self.appCoordinator = appCoordinator
        
        window?.rootViewController = appCoordinator.start()
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        return true
    }
}

