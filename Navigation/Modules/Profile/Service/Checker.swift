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
    let password: String = {
        let element = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let char1 = element.randomElement()
        let char2 = element.randomElement()
        let char3 = element.randomElement()
        let char4 = element.randomElement()
        var string = ""
        string.append(char1!)
        string.append(char2!)
        string.append(char3!)
        string.append(char4!)
        return string
    }()
    
    func check(login: String, password: String) -> Bool {
        self.login == login && self.password == password
    }
}
