//
//  File.swift
//  TestOne
//
//  Created by Alexander on 07.03.2023.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    //    MARK: - Property
    
    static let reuseId = "PhotosTableViewCell"
    
    private lazy var lable: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.text = "Photos"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var arrow: UIImageView = {
        let arrow = UIImage(systemName: "arrow.forward")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let arrowView = UIImageView(image: arrow)
        arrowView.translatesAutoresizingMaskIntoConstraints = false
        return arrowView
    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        
        for item in Pokemon.makeArray().prefix(4){
            let imageCell: UIImageView = {
                var image = UIImageView()
                image.image = UIImage(named: item.name)
                image.layer.cornerRadius = 6
                image.backgroundColor = .gray
                image.translatesAutoresizingMaskIntoConstraints = false
                image.heightAnchor.constraint(equalTo: image.widthAnchor).isActive = true
                return image
            }()
            stack.addArrangedSubview(imageCell)
        }
        return stack
    }()
    
    //    MARK: - LifeCycle
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        setupLayout()
    }
    
    //    MARK: - Function
    
    private func setupSubviews(){
        contentView.addSubview(lable)
        contentView.addSubview(arrow)
        contentView.addSubview(stack)
        selectionStyle = .none
    }
    
    private func setupLayout(){
        
        NSLayoutConstraint.activate([
            
            lable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            lable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            stack.topAnchor.constraint(equalTo: lable.bottomAnchor, constant: 12),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -12),
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 12),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            arrow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            arrow.centerYAnchor.constraint(equalTo: lable.centerYAnchor)
            
        ])
    }
}

