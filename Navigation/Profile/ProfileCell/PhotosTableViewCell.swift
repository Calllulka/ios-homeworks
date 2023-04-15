//
//  File.swift
//  TestOne
//
//  Created by Alexander on 07.03.2023.
//

import UIKit
import SnapKit

class PhotosTableViewCell: UITableViewCell {
    
    //    MARK: - Property
    
    static let reuseId = "PhotosTableViewCell"
    
    private lazy var lable: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.text = "Photos"
        return label
    }()
    
    private lazy var arrow: UIImageView = {
        let arrow = UIImage(systemName: "arrow.forward")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let arrowView = UIImageView(image: arrow)
        return arrowView
    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .equalSpacing
        
        for item in Pokemon.makeArray().prefix(4){
            let imageCell: UIImageView = {
                var image = UIImageView()
                image.image = UIImage(named: item.name)
                image.layer.cornerRadius = 6
                image.backgroundColor = .gray
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
        
        lable.snp.makeConstraints {
            $0.top.leading.equalTo(contentView).inset(12)
        }
        stack.snp.makeConstraints {
            $0.top.equalTo(lable.snp.bottom).offset(12)
            $0.bottom.leading.trailing.equalTo(contentView).inset(12)
        }
        arrow.snp.makeConstraints {
            $0.trailing.equalTo(contentView).offset(-12)
            $0.centerY.equalTo(lable.snp.centerY)
        }
    }
}

