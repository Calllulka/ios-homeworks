//
//  ProfileHeaderView.swift
//  TestOne
//
//  Created by Alexander on 19.02.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    var statusText: String?
    
    
    var avatarImageView: UIImageView = {
        var imageView = UIImageView(image: UIImage(named: "avatarImageView"))
        imageView.layer.borderWidth = 3.0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 55
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var fullNameLabel: UILabel = {
        var lable = UILabel()
        lable.text = "Crazy Frog"
        lable.textColor = .black
        lable.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    var statusLabel: UILabel = {
        var lable = UILabel()
        lable.text = "Waiting for something..."
        lable.textColor = .gray
        lable.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        lable.translatesAutoresizingMaskIntoConstraints = false
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
        button.translatesAutoresizingMaskIntoConstraints = false
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
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        textField.textAlignment = .center
        return textField
    }()
    
    init() {
        super.init(frame: .zero)
        prepareView()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func prepareView() {
        addSubview(setStatusButton)
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
    }
    
    private func makeConstraints() {
        avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 110).isActive = true
        avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        
        fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16).isActive = true
        fullNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
        setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 40).isActive = true
        setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        setStatusButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -58).isActive = true
        statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16).isActive = true
        
        statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 4).isActive = true
        statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16).isActive = true
        statusTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
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
