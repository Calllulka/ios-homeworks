//
//  ProfileViewModel.swift
//  Navigation
//
//  Created by Alexander on 01.05.2023.
//

import Foundation
import StorageService

protocol ProfileViewModelProtocol {
    var onStateDidChange: ((ProfileViewModel.State) -> ())?  { get set }
    func updateState(viewInput: ProfileViewModel.ViewInput)
}

final class ProfileViewModel: ProfileViewModelProtocol {
    enum State {
        case setUserData(User)
        case setPostsData( [Post])
        case statusDidChanged(String?)
    }
    
    enum ViewInput {
        case needData
        case statusDidChanged(String?)
    }
    
    var onStateDidChange: ((ProfileViewModel.State) -> ())?
    
    private let model: ProfileModel

    init(model: ProfileModel) {
        self.model = model
    }
    
    func updateState(viewInput: ProfileViewModel.ViewInput) {
        switch viewInput {
        case .needData:
            onStateDidChange?(.setUserData(model.user))
            onStateDidChange?(.setPostsData(model.posts))
        case .statusDidChanged(let statusText):
//           Логика со статусом
            onStateDidChange?(.statusDidChanged(statusText))
        }
    }
}
