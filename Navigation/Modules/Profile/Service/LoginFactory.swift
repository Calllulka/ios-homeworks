//
//  LoginFactory.swift
//  Navigation
//
//  Created by Alexander on 19.04.2023.
//

import UIKit

protocol LoginFactory {
    func makeLoginInspector() -> LoginInspector
}

struct MyLoginFactory: LoginFactory {
    func makeLoginInspector() -> LoginInspector {
        let user =  User(login: "kek",
                         password: Checker.shared.password,
                         name: "KventinTarantino",
                         status: "I love swift",
                         avatar: UIImage(named: "avatarImageView")!)
        
        let userService = CurrentUserService(user: user)
        return LoginInspector(userService: userService)
    }
}
