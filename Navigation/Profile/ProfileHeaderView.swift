//
//  ProfileHeaderView.swift
//  TestOne
//
//  Created by Alexander on 19.02.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    var avatar: UIImageView = {
        var imageView = UIImageView(image: UIImage(named: "Image"))
        imageView.layer.borderWidth = 3.0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 55
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var lable: UILabel = {
        var lable = UILabel()
        lable.text = "Crazy Frog"
        lable.textColor = .black
        lable.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    var lableTwo: UILabel = {
        var lable = UILabel()
        lable.text = "Waiting for something..."
        lable.textColor = .gray
        lable.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    var button: UIButton = {
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
    
    var textField: UITextField = {
       let textField = UITextField()
        textField.backgroundColor = .white
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
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
        addSubview(button)
        addSubview(avatar)
        addSubview(lable)
        addSubview(lableTwo)
        addSubview(textField)
    }
    
    private func makeConstraints() {
        avatar.heightAnchor.constraint(equalTo: avatar.widthAnchor).isActive = true
        avatar.widthAnchor.constraint(equalToConstant: 110).isActive = true
        avatar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        avatar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        
        lable.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        lable.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 16).isActive = true
        lable.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
        button.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 40).isActive = true
        button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        lableTwo.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -34).isActive = true
        lableTwo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        lableTwo.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 16).isActive = true
        
//        textField.topAnchor.constraint(equalTo: lableTwo.bottomAnchor, constant: 4).isActive = true
//        textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
//        textField.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 16).isActive = true
//        textField.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    @objc func tapButton() {
        print("\(button.title(for: .normal)!)")
    }
}
