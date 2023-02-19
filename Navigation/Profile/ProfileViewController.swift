//
//  ProfileViewController.swift
//  TestOne
//
//  Created by Alexander on 15.02.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(profileView)
    }
    
    override func viewWillLayoutSubviews() {
        profileView.frame = view.frame
    }
}
