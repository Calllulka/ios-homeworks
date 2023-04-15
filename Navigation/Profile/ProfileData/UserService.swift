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

class User {
    var login = "Kventin"
    var password = "1234"
    var name = "KventinTarantino"
    var status = "I love swift"
    var avatar: UIImage = UIImage(named: "avatarImageView")!
    
    init() {}
}

class CurrentUserService: UserService {
    private let user: User

    init(user: User) {
        self.user = user
    }
    
    func currentLogin(login: String) -> User? {
        user.login == login ? user : nil
    }
}

class TestUserService: UserService {
    private let user: User

    init(user: User) {
        self.user = user
        self.user.avatar = UIImage(named: "Test")!
        self.user.login = "Test"
        self.user.name = "TestName"
        self.user.password = "TestPassword"
        self.user.status = "TestStatus"
    }
    
    func currentLogin(login: String) -> User? {
        user.login == login ? user : nil
    }
}
