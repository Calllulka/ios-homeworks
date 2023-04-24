//
//  Checker.swift
//  Navigation
//
//  Created by Alexander on 19.04.2023.
//

import Foundation

class Checker {
    static let shared = Checker()
    
    private init() {}
    
    private let login = "kek"
    private let password = "111"
    
    func check(login: String, password: String) -> Bool {
        self.login == login && self.password == password
    }
}
