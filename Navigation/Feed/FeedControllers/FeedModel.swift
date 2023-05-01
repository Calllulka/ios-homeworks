//
//  FeedModel.swift
//  Navigation
//
//  Created by Alexander on 27.04.2023.
//

import Foundation

protocol FeedModelProtocol: AnyObject {
    func check(word: String?) -> Bool
}

class FeedModel: FeedModelProtocol {
    private let password = "Пароль"
    
    func check(word: String?) -> Bool {
        password == word
    }
}
