//
//  ProfileHeaderView.swift
//  TestOne
//
//  Created by Alexander on 19.02.2023.
//

import UIKit
import SnapKit

class ProfileHeaderView: UIView {
    
    //    MARK: property

    var statusText: String?
    
    var avatarImageView: UIImageView = {
        var imageView = UIImageView(image: UIImage(named: "avatarImageView"))
        imageView.layer.borderWidth = 3.0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 55
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var fullNameLabel: UILabel = {
        var lable = UILabel()
        lable.text = "Kventin Tarantino"
        lable.textColor = .black
        lable.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return lable
    }()
    
    var statusLabel: UILabel = {
        var lable = UILabel()
        lable.text = "Waiting for something..."
        lable.textColor = .gray
        lable.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return lable
    }()
    
    var setStatusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show status", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.setTitleColor(.white, for: .normal)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.cornerRadius = 4.0
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        return button
    }()
    
    var statusTextField: UITextField = {
        var textField = UITextField()
        textField.backgroundColor = .white
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        textField.textAlignment = .center
        return textField
    }()
    
    //    MARK: - LifeCycle
    
    init() {
        super.init(frame: .zero)
        prepareView()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: function
    
    private func prepareView() {
        addSubview(setStatusButton)
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
    }
    
    private func makeConstraints() {
        avatarImageView.snp.makeConstraints {
            $0.size.equalTo(110)
            $0.top.leading.equalToSuperview().inset(16)
        }
        
        fullNameLabel.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(16)
            $0.leading.equalTo(avatarImageView.snp.trailing).offset(16)
        }
        
        setStatusButton.snp.makeConstraints {
            $0.top.equalTo(avatarImageView.snp.bottom).offset(50)
            $0.leading.trailing.bottom.equalToSuperview().inset(16)
            $0.height.equalTo(40)
        }
        
        statusTextField.snp.makeConstraints {
            $0.bottom.equalTo(setStatusButton.snp.top).inset(-16)
            $0.trailing.equalToSuperview().inset(16)
            $0.leading.equalTo(avatarImageView.snp.trailing).offset(16)
            $0.height.equalTo(40)
        }
        
        statusLabel.snp.makeConstraints {
            $0.bottom.equalTo(statusTextField.snp.top).offset(-12)
            $0.trailing.equalToSuperview().inset(16)
            $0.leading.equalTo(avatarImageView.snp.trailing).offset(16)
        }
        
    }
    
    @objc func tapButton() {
        print("\(setStatusButton.title(for: .normal)!)")
        guard let text = statusText else {
            statusLabel.text = "I'm frog, ping, ping"
            return
        }
        statusLabel.text = text
    }
    
    @objc func statusTextChanged(_ textField: UITextField){
        statusText = textField.text
    }
}

