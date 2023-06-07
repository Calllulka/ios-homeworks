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
        case password(String)
        case loading(Bool)
    }
    
    enum ViewInput {
        case buttonDidTap(String?, String?)
        case pickUpPassword
    }
    
    weak var coordinator: LogInCoordinator?
    let bruteForce = BruteForce()
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
        case .pickUpPassword:
            let pass = Checker.shared.password
            onStateDidChange?(.loading(true))
            bruteForce.bruteForce(passwordToUnlock: pass) { [weak self] unlPass in
                self?.onStateDidChange?(.loading(false))
                self?.onStateDidChange?(.password(unlPass))
            }
        }
    }
}
