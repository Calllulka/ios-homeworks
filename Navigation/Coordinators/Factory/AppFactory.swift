//
//  AppFactory.swift
//  Navigation
//
//  Created by Alexander on 05.05.2023.
//

import UIKit

final class AppFactory {
    private let logInModel: LogInModel
    private let feedModel: FeedModel
    let myFactory = MyLoginFactory()

    init(logInModel: LogInModel, feedModel: FeedModel) {
        self.logInModel = logInModel
        self.feedModel = feedModel
    }

    func makeModule(ofType moduleType: Module.ModuleType) -> Module {
        switch moduleType {
        case .logIn:
            logInModel.loginDelegate = myFactory.makeLoginInspector()
            let viewModel = LogInViewModel(model: logInModel)
            let viewController = LogInViewController(viewModel: viewModel)
            let view = UINavigationController(rootViewController: viewController)
            return Module(moduleType: .logIn, viewModel: viewModel, view: view)
        case .feed:
            let viewModel = FeedViewModel(model: feedModel)
            let view = FeedViewController(viewModel: viewModel)
            return Module(moduleType: .feed, viewModel: viewModel, view: view)
        }
    }
}
