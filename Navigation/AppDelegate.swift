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
        window?.backgroundColor = .red
        return true
    }
}

func createFeedViewController() -> UINavigationController {
    let feedViewController = FeedViewController()
    feedViewController.title = "Лента"
    feedViewController.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "doc.richtext"), tag: 0)
    return UINavigationController(rootViewController: feedViewController)
}


func createProfileViewController() -> UINavigationController {
    let profileViewController = ProfileViewController()
    profileViewController.title = "Профиль"
    profileViewController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.circle"), tag: 1)
    return UINavigationController(rootViewController: profileViewController)
}

func createTabBarController() -> UITabBarController {
    let tabBarController = UITabBarController()
    UITabBar.appearance().backgroundColor = .systemBlue
    tabBarController.viewControllers = [createProfileViewController(), createFeedViewController()]
    return tabBarController
}
