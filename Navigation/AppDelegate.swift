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
    let myFactory = MyLoginFactory()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = createTabBarController()
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        return true
        
    }
    
    private func createFeedViewController() -> UINavigationController {
        let feedViewController = FeedViewController()
        feedViewController.title = "Feed"
        feedViewController.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "doc.richtext"), tag: 0)
        return UINavigationController(rootViewController: feedViewController)
    }

    private func createLogInViewController() -> UINavigationController {
        let logInviewController = LogInViewController()
        logInviewController.loginDelegate = myFactory.makeLoginInspector()
        logInviewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), tag: 1)
        
        return UINavigationController(rootViewController: logInviewController)
    }

    private func createTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        UITabBar.appearance().backgroundColor = .systemBlue
        tabBarController.viewControllers = [createLogInViewController(), createFeedViewController()]
        return tabBarController
    }
}

