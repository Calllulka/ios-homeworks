//
//  LoginInspector.swift
//  Navigation
//
//  Created by Alexander on 19.04.2023.
//

import Foundation

class LoginInspector {
    private let userService: UserService
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    deinit {
        print("I am end")
    }
}

extension LoginInspector: LoginViewControllerDelegate {
    func check(login: String, password: String) -> User? {
        Checker.shared.check(login: login, password: password) ? userService.currentLogin(login: login) : nil
    }
}
