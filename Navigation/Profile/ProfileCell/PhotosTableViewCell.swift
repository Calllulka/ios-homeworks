//
//  File.swift
//  TestOne
//
//  Created by Alexander on 07.03.2023.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    static let reuseId = "PhotosTableViewCell"
    
//    var dataSourse = Pokemon.makeArray()
    
    private lazy var lable: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.text = "Photos"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var button: UIButton = {
       var button = UIButton()
        button.setImage(UIImage(named: "arrow.right"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var stack: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        for item in Pokemon.makeArray().prefix(4){
            let imageCell: UIImageView = {
                var image = UIImageView()
                image.image = UIImage(named: item.name)
                image.clipsToBounds = true
                image.layer.cornerRadius = 6
                image.backgroundColor = .gray
                stack.addArrangedSubview(image)
                return image
            }()
        }
        return stack
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        setupLayout()
    }
    
    private func setupSubviews(){
        contentView.addSubview(lable)
        contentView.addSubview(button)
        contentView.addSubview(stack)
    }
    
    private func setupLayout(){
        NSLayoutConstraint.activate([
        
            lable.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            lable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            
            stack.topAnchor.constraint(equalTo: lable.bottomAnchor, constant: 12),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor,constant: 12),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 12),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 12),
            
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 12),
            button.centerYAnchor.constraint(equalTo: lable.centerYAnchor),
            button.bottomAnchor.constraint(equalTo: stack.topAnchor, constant: 12)
        
        ])
    }
}

