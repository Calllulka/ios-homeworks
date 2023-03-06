//
//  File.swift
//  TestOne
//
//  Created by Alexander on 07.03.2023.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    let reuseId = "PhotosTableViewCell"
    
    private lazy var lable: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.text = "Photos"
        return label
    }()
    
    private lazy var button: UIButton = {
       var button = UIButton()
        button.setImage(UIImage(named: "arrow.right"), for: .normal)
        return button
    }()
    
    
}

