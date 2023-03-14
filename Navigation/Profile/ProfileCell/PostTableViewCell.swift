//
//  PostTableViewCell.swift
//  TestOne
//
//  Created by Alexander on 07.03.2023.
//

import UIKit

final class PostTableViewCell: UITableViewCell {

//    MARK: - Property
    
    static let id = "ProfileCell"

    private var labelTop: UILabel = {
       var label = UILabel()
        label.text = "Kventin Tarantino"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var imageCellView: UIImageView = {
       var image = UIImageView(image: UIImage(named: "ImageOne"))
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private var labelTwo: UILabel = {
       var label = UILabel()
        label.numberOfLines = 0
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var labelLike: UILabel = {
       let like = UILabel()
        like.textColor = .black
        like.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        like.translatesAutoresizingMaskIntoConstraints = false
        return like
    }()

    private var labelViews: UILabel = {
       let views = UILabel()
        views.textColor = .black
        views.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        views.translatesAutoresizingMaskIntoConstraints = false
        views.textAlignment = .right
        return views
    }()

    //    MARK: - LifeCycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    MARK: - Function
    
    func configure(with post: Post) {
        imageCellView.image = UIImage(named: post.image)
        labelTop.text = post.author
        labelTwo.text = post.description
        labelLike.text = String("Likes: \(post.likes)")
        labelViews.text = String("Views: \(post.views)")

    }

    func addConstraints() {

        addSubview(labelTop)
        addSubview(labelTwo)
        addSubview(labelLike)
        addSubview(labelViews)
        addSubview(imageCellView)

        NSLayoutConstraint.activate([
            labelTop.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            labelTop.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            labelTop.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            imageCellView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageCellView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageCellView.topAnchor.constraint(equalTo: labelTop.bottomAnchor,constant: 12),
            imageCellView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),

            labelTwo.topAnchor.constraint(equalTo: imageCellView.bottomAnchor, constant: 16),
            labelTwo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            labelTwo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            labelLike.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            labelLike.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            labelLike.topAnchor.constraint(equalTo: labelTwo.bottomAnchor, constant: 16),

            labelViews.centerYAnchor.constraint(equalTo: labelLike.centerYAnchor),
            labelViews.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)

        ])
    }
}
