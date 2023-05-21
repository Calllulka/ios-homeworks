//
//  FeedViewModel.swift
//  Navigation
//
//  Created by Alexander on 05.05.2023.
//

import Foundation
import StorageService

protocol FeedViewModelProtocol: ViewModelProtocol {
    var onStateDidChange: ((FeedViewModel.State) -> ())?  { get set }
    func updateState(viewInput: FeedViewModel.ViewInput)
}

final class FeedViewModel: FeedViewModelProtocol {
    enum State {
        case checkPassword(Bool?)
    }
    
    enum ViewInput {
        case checkPassword(String?)
    }
    weak var coordinator: FeedCoordinator? {
    }
    
    var onStateDidChange: ((FeedViewModel.State) -> ())?
    
    private let model: FeedModel
    
    init(model: FeedModel) {
        self.model = model
    }
    
    func updateState(viewInput: FeedViewModel.ViewInput) {
        switch viewInput {
        case .checkPassword(let password):
            coordinator?.pushPostViewController()
            onStateDidChange?(.checkPassword(model.password == password))
        }
    }
}
