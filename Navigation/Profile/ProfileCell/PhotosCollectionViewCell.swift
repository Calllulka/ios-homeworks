//
//  PhotosCollectionViewCell.swift
//  TestOne
//
//  Created by Alexander on 07.03.2023.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "PhotosCollectionViewCell"
    
    // MARK: - Subviews
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    // MARK: - Lifecycle
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupView()
        setupSubviews()
        setupLayouts()
    }
    
    // MARK: - Private
    
    private func setupView() {
        contentView.clipsToBounds = true
        contentView.backgroundColor = .white
    }
    
    private func setupSubviews() {
        contentView.addSubview(profileImageView)
    }
    
    private func setupLayouts() {
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            profileImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            profileImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    // MARK: - Public
    
    func setup(with pokemon: Pokemon) {
        profileImageView.image = UIImage(named: pokemon.name)
    }
}
