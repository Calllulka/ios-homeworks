//
//  FeedCoordinator.swift
//  Navigation
//
//  Created by Alexander on 05.05.2023.
//

import UIKit

final class FeedCoordinator: ModuleCoordinatable {
    let moduleType: Module.ModuleType

    private let factory: AppFactory

    private(set) var module: Module?
    private(set) var childCoordinators: [Coordinatable] = []

    init(moduleType: Module.ModuleType, factory: AppFactory) {
        self.moduleType = moduleType
        self.factory = factory
    }

    func start() -> UIViewController {
        let module = factory.makeModule(ofType: moduleType)
        let viewController = module.view
        viewController.tabBarItem = moduleType.tabBarItem
        (module.viewModel as? FeedViewModel)?.coordinator = self
        self.module = module
        return viewController
    }
    
    func pushPostViewController() {
        let postViewController = PostViewController()
        (module?.view as? UINavigationController)?.pushViewController(postViewController, animated: true)
    }
}
