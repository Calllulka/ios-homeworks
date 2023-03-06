//
//  FeedViewController.swift
//  TestOne
//
//  Created by Alexander on 15.02.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    var post = PostFeed(title: "Мой пост")
    
    private lazy var buttonOne: UIButton = {
       let button = UIButton()
        button.setTitle("Кнопка 1", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonTwo: UIButton = {
       let button = UIButton()
        button.setTitle("Кнопка 2", for: .normal)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 20.0
        
        stackView.addArrangedSubview(buttonOne)
        stackView.addArrangedSubview(buttonTwo)
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        view.addSubview(stackView)
        addConstraintsStackView()
    }
    
    @objc func buttonAction() {
        let postViewController = PostViewController()
        postViewController.titlePost = post.title
        self.navigationController?.pushViewController(postViewController, animated: true)
    }
    
    private func addConstraintsStackView() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
    
}



