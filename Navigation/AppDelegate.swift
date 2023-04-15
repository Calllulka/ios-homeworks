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
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = createTabBarController()
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        return true
        
    }
}

func createFeedViewController() -> UINavigationController {
    let feedViewController = FeedViewController()
    feedViewController.title = "Feed"
    feedViewController.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "doc.richtext"), tag: 0)
    return UINavigationController(rootViewController: feedViewController)
}

func createLogInViewController() -> UINavigationController {
    let user = User()
    #if DEBUG
    let currentUserService = TestUserService(user: user)
    #else
    let currentUserService = CurrentUserService(user: user)
    #endif
    let logInviewController = LogInViewController(currntUserService: currentUserService)
    logInviewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), tag: 1)
    
    return UINavigationController(rootViewController: logInviewController)
}

func createTabBarController() -> UITabBarController {
    let tabBarController = UITabBarController()
    UITabBar.appearance().backgroundColor = .systemBlue
    tabBarController.viewControllers = [createLogInViewController(), createFeedViewController()]
    return tabBarController
}

