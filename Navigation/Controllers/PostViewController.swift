//
//  PostViewController.swift
//  TestOne
//
//  Created by Alexander on 15.02.2023.
//

import UIKit

class PostViewController: UIViewController {
    var titlePost = "UserName"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemGray
        self.navigationItem.title = titlePost
        
        let barButton = UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .plain, target: self, action: #selector(actionBarbutton))
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    @objc func actionBarbutton() {
        let infoController = InfoViewController()
        present(infoController, animated: true, completion: nil)
    }
}
