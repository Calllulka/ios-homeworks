//
//  ProfileHeaderView.swift
//  TestOne
//
//  Created by Alexander on 19.02.2023.
//

import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    //    MARK: property
    
    static let identifier = "TableHeader"
    
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
        lable.text = "Kventin Tarantino"
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
    
    override init(reuseIdentifier: String?) {
            super.init(reuseIdentifier: reuseIdentifier)
            contentView.addSubview(setStatusButton)
            contentView.addSubview(avatarImageView)
            contentView.addSubview(fullNameLabel)
            contentView.addSubview(statusLabel)
            contentView.addSubview(statusTextField)
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
        
        NSLayoutConstraint.activate([
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 110),
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),

            fullNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            fullNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 40),
            setStatusButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 40),

            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -58),
            statusLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),

            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 4),
            statusTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
        ])
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

