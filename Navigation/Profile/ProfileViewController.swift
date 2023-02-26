//
//  ProfileViewController.swift
//  TestOne
//
//  Created by Alexander on 15.02.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileView = ProfileHeaderView()
    
    var buttonBotton: UIButton = {
        let button = UIButton()
        button.setTitle("Нижняя кнопка", for: .normal)
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(profileView)
        view.addSubview(buttonBotton)
        makeConstraints()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    override func viewWillLayoutSubviews() {
    }
    
    func makeConstraints() {
        profileView.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            profileView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            profileView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            profileView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            profileView.heightAnchor.constraint(equalToConstant: 220),
            
            buttonBotton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttonBotton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            buttonBotton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            buttonBotton.heightAnchor.constraint(equalToConstant: 30)
            
        ])
    }
}
