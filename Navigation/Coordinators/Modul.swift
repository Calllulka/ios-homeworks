//
//  Modul.swift
//  Navigation
//
//  Created by Alexander on 05.05.2023.
//

import UIKit

protocol ViewModelProtocol: AnyObject {}

struct Module {
    enum ModuleType {
        case logIn
        case feed
    }

    let moduleType: ModuleType?
    let viewModel: ViewModelProtocol
    let view: UIViewController
}

extension Module.ModuleType {
    var tabBarItem: UITabBarItem {
        switch self {
        case .logIn:
            return UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), tag: 1)
        case .feed:
            return UITabBarItem(title: "Лента", image: UIImage(systemName: "doc.richtext"), tag: 0)
        }
    }
}
