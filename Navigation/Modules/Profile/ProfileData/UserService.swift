//
//  UserData.swift
//  Navigation
//
//  Created by Alexander on 15.04.2023.
//

import UIKit

protocol UserService {
    func currentLogin(login: String) -> User?
}

struct User {
    var login: String
    var password: String
    var name: String
    var status: String
    var avatar: UIImage
}

class CurrentUserService: UserService {
    private let user: User

    init(user: User) {
        self.user = user
    }
    
    deinit {
        print("serv end")
    }
    
    func currentLogin(login: String) -> User? {
        user.login == login ? user : nil
    }
}
