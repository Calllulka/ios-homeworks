//
//  AppCoordinator.swift
//  Navigation
//
//  Created by Alexander on 05.05.2023.
//

import UIKit

final class AppCoordinator: Coordinatable {
    private(set) var childCoordinators: [Coordinatable] = []

    private let factory: AppFactory

    init(factory: AppFactory) {
        self.factory = factory
    }

    func start() -> UIViewController {
        let logInCoordinator = LogInCoordinator(moduleType: .logIn, factory: factory)
        let feedCoordinator = FeedCoordinator(moduleType: .feed, factory: factory)

        let appTabBarController = AppTabBarController(viewControllers: [
            logInCoordinator.start(),
            feedCoordinator.start()
        ])

        addChildCoordinator(logInCoordinator)
        addChildCoordinator(feedCoordinator)

        return appTabBarController
    }

    func addChildCoordinator(_ coordinator: Coordinatable) {
        guard !childCoordinators.contains(where: { $0 === coordinator }) else {
            return
        }
        childCoordinators.append(coordinator)
    }

    func removeChildCoordinator(_ coordinator: Coordinatable) {
        childCoordinators = childCoordinators.filter { $0 === coordinator }
    }
}
