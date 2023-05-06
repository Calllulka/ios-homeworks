//
//  LogInModel.swift
//  Navigation
//
//  Created by Alexander on 05.05.2023.
//

import Foundation

protocol LoginViewControllerDelegate: AnyObject {
    func check(login: String, password: String) -> User?
}

class LogInModel {
    var loginDelegate: LoginViewControllerDelegate?
}
