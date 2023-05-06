//
//  PostTableViewCell.swift
//  TestOne
//
//  Created by Alexander on 07.03.2023.
//

import UIKit
import StorageService
import SnapKit
import iOSIntPackage

final class PostTableViewCell: UITableViewCell {

//    MARK: - Property
    
    static let id = "ProfileCell"
    
    let process = ImageProcessor()
    
    private var postAuthor: UILabel = {
       var label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        return label
    }()

    private var imageCellView: UIImageView = {
       var image = UIImageView(image: UIImage(named: "ImageOne"))
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFit
        return image
    }()

    private var postDescription: UILabel = {
       var label = UILabel()
        label.numberOfLines = 0
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()

    private var postLikes: UILabel = {
       let like = UILabel()
        like.textColor = .black
        like.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return like
    }()

    private var postViews: UILabel = {
       let views = UILabel()
        views.textColor = .black
        views.font = UIFont.systemFont(ofSize: 16, weight: .regular)
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
        process.processImage(sourceImage: UIImage(named: post.image) ?? UIImage(), filter: .chrome) { img in
            imageCellView.image = img
        }
        
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

        postAuthor.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(16)
        }
        imageCellView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(postAuthor.snp.bottom).offset(12)
        }
        postDescription.snp.makeConstraints {
            $0.top.equalTo(imageCellView.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(16)
        }
        postLikes.snp.makeConstraints {
            $0.top.equalTo(postDescription.snp.bottom).offset(16)
            $0.leading.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().offset(-16)
        }
        postViews.snp.makeConstraints {
            $0.centerY.equalTo(postLikes.snp.centerY)
            $0.trailing.equalToSuperview().inset(16)
        }
    }
}
