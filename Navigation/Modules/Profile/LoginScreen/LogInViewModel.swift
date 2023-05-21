//
//  LogInViewModel.swift
//  Navigation
//
//  Created by Alexander on 05.05.2023.
//
import Foundation

protocol LogInViewModelProtocol: ViewModelProtocol {
    var onStateDidChange: ((LogInViewModel.State) -> ())?  { get set }
    func updateState(viewInput: LogInViewModel.ViewInput)
}

final class LogInViewModel: LogInViewModelProtocol {
    enum State {
        case succsess
        case error
    }
    
    enum ViewInput {
        case buttonDidTap(String?, String?)
    }
    
    weak var coordinator: LogInCoordinator?
    var onStateDidChange: ((LogInViewModel.State) -> ())?
    
    private(set) var state: State = .succsess {
        didSet {
            onStateDidChange?(state)
        }
    }
    
    private let model: LogInModel
    
    init(model: LogInModel) {
        self.model = model
    }
    
    func updateState(viewInput: LogInViewModel.ViewInput) {
        switch viewInput {
        case .buttonDidTap(let login, let password):
            guard let loginText = login,
                  let passwordText = password
            else { return }
            
            let user = (model.loginDelegate?.check(login: loginText, password: passwordText))
            guard let userGood = user else {
                return state = .error
            }
            coordinator?.pushProfileController(user: userGood)
        }
    }
}
