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

    private var postAuthor: UILabel = {
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

    private var postDescription: UILabel = {
       var label = UILabel()
        label.numberOfLines = 0
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var postLikes: UILabel = {
       let like = UILabel()
        like.textColor = .black
        like.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        like.translatesAutoresizingMaskIntoConstraints = false
        return like
    }()

    private var postViews: UILabel = {
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
        postAuthor.text = post.author
        postDescription.text = post.description
        postLikes.text = String("Likes: \(post.likes)")
        postViews.text = String("Views: \(post.views)")

    }

    func addConstraints() {

        addSubview(postAuthor)
        addSubview(postDescription)
        addSubview(postLikes)
        addSubview(postViews)
        addSubview(imageCellView)

        NSLayoutConstraint.activate([
            postAuthor.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            postAuthor.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            postAuthor.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            imageCellView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageCellView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageCellView.topAnchor.constraint(equalTo: postAuthor.bottomAnchor,constant: 12),
            imageCellView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),

            postDescription.topAnchor.constraint(equalTo: imageCellView.bottomAnchor, constant: 16),
            postDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            postDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            postLikes.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            postLikes.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            postLikes.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),

            postViews.centerYAnchor.constraint(equalTo: postLikes.centerYAnchor),
            postViews.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)

        ])
    }
}
