//
//  FeedViewController.swift
//  TestOne
//
//  Created by Alexander on 15.02.2023.
//

import UIKit
import SnapKit

class FeedViewController: UIViewController {
    
//    MARK: - Property
    
    private var viewModel: FeedViewModelProtocol
    
    var post = PostFeed(title: "Мой пост")
    
    private lazy var checkGuessButton = CustomButton(title: "Проверить", color: .blue, titleColor: .white,cornerRadius: 10)

    
    private var inputText: UITextField = {
        let textField = UITextField()
         textField.backgroundColor = .white
        textField.font = .systemFont(ofSize: 50)
        textField.textAlignment = .center
        textField.text = "Пароль"
         return textField
    }()
    
    private var colorLabel: UILabel = {
       let label = UILabel()
        label.alpha = 0
        label.backgroundColor = .red
        label.textAlignment = .center
        return label
    }()
    
    init(viewModel: FeedViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(checkGuessButton)
        view.addSubview(inputText)
        view.addSubview(colorLabel)
        addConstraintsStackView()
        buttonAction()
        bind()
    }
    
//    MARK: - Function
    
    private func buttonAction() {
        checkGuessButton.action = {
            self.viewModel.updateState(viewInput: .checkPassword(self.inputText.text))
        }
    }
    
    private func addConstraintsStackView() {
        checkGuessButton.snp.makeConstraints {
            $0.top.equalTo(100)
            $0.centerX.equalToSuperview()
        }
        inputText.snp.makeConstraints {
            $0.top.equalTo(checkGuessButton.snp.bottom).offset(100)
            $0.centerX.equalToSuperview()
        }
        colorLabel.snp.makeConstraints {
            $0.top.equalTo(inputText.snp.bottom).offset(100)
            $0.leading.trailing.equalToSuperview().inset(100)
            
        }
    }
    
    //    MARK: - bind

    private func bind() {
        viewModel.onStateDidChange = { [weak self] state in
            guard let self = self else { return }
            switch state {
            case .checkPassword(let bool): 
                if (bool != nil) {
                    self.colorLabel.alpha = 1
                    self.colorLabel.backgroundColor = .green
                    self.colorLabel.text = "Правильно!"
                } else {
                    self.colorLabel.alpha = 1
                    self.colorLabel.backgroundColor = .red
                    self.colorLabel.text = "Неправильно!"
                }
            }
        }
    }
}



