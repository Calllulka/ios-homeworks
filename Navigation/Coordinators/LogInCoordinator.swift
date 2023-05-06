//
//  LogInCoordinator.swift
//  Navigation
//
//  Created by Alexander on 05.05.2023.
//

import UIKit

final class LogInCoordinator: ModuleCoordinatable {
    let moduleType: Module.ModuleType
    var loginDelegate: LoginViewControllerDelegate?

    private let factory: AppFactory

    private(set) var childCoordinators: [Coordinatable] = []
    private(set) var module: Module?

    init(moduleType: Module.ModuleType, factory: AppFactory) {
        self.moduleType = moduleType
        self.factory = factory
    }

    func start() -> UIViewController {
        let module = factory.makeModule(ofType: moduleType)
        let viewController = module.view
        viewController.tabBarItem = moduleType.tabBarItem
        (module.viewModel as? LogInViewModel)?.coordinator = self
        self.module = module
        return viewController
    }

    func pushProfileController(user: User) {
        let profileModel = ProfileModel(user: user)
        let profileViewModel = ProfileViewModel(model: profileModel)
        let profileViewController = ProfileViewController(viewModel: profileViewModel)
        (module?.view as? UINavigationController)?.pushViewController(profileViewController, animated: true)
    }
}
