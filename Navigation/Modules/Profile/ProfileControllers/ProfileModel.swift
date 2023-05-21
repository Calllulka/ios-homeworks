//
//  ProfileModel.swift
//  Navigation
//
//  Created by Alexander on 01.05.2023.
//

import Foundation
import StorageService

class ProfileModel {
    
    let user: User
    let posts = Post.make()
    
    init(user: User) {
        self.user = user
    }
}
