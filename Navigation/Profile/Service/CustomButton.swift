//
//  CustomButton.swift
//  Navigation
//
//  Created by Alexander on 27.04.2023.
//

import UIKit

final class CustomButton: UIButton {
    
    var action: (() -> ())?
    
    private var title: String
    private let color: UIColor
    private let titleColor: UIColor
    private var cornerRadius: Int
    
    init(title: String, color: UIColor, titleColor: UIColor, cornerRadius: Int) {
        self.title = title
        self.color = color
        self.titleColor = titleColor
        self.cornerRadius = cornerRadius
        super.init(frame: .zero)
        configure()
    }
    
    convenience init(title: String, color: UIColor, titleColor: UIColor) {
        self.init(title: title, color: color, titleColor: titleColor, cornerRadius: 0)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setTitle(title, for: .normal)
        backgroundColor = color
        setTitleColor(titleColor, for: .normal)
        layer.cornerRadius = CGFloat(cornerRadius)
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        action?()
    }
}
