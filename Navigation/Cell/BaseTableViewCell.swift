//
//  BaseTableViewCell.swift
//  TestOne
//
//  Created by Alexander on 27.02.2023.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: .subtitle,
                   reuseIdentifier: reuseIdentifier)
        
        tuneView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        isHidden = false
        isSelected = false
        isHighlighted = false
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        guard let view = selectedBackgroundView else {
            return
        }
        contentView.insertSubview(view, at: 0)
        selectedBackgroundView?.isHidden = !selected
    }
    
    private func tuneView() {
        backgroundColor = .tertiarySystemBackground
        contentView.backgroundColor = .tertiarySystemBackground
        textLabel?.backgroundColor = .clear
        detailTextLabel?.backgroundColor = .clear
        imageView?.backgroundColor = .clear
        
        accessoryView = nil
        accessoryType = .disclosureIndicator
        
        selectionStyle = .gray
        let selectedView = UIView()
        selectedView.backgroundColor = .gray
        selectedBackgroundView = selectedView
    }
    
//    func update(_ model: Post) {
//        textLabel?.text = model.author
//        detailTextLabel?.text = model.description
//        imageView?.image = UIImage.init(named: model.image)
//
//    }
    
}
