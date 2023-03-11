//
//  ProfileViewController.swift
//  TestOne
//
//  Created by Alexander on 15.02.2023.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    //    MARK: - Property
    
    private var dataSourse = Post.make()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.id)
        table.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.reuseId)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.estimatedRowHeight = 70
        return table
    }()
    
    private let header = ProfileHeaderView()
    
    
    
    //    MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        setupConstrains()
        tapAvatar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    //    MARK: - Function setupConstraint
    
    private func prepareView() {
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(header)
        view.addSubview(tableView)
        view.backgroundColor = .white
        view.bringSubviewToFront(header)
    }
    
    private func tapAvatar() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(avatarTap(sender:)))
        header.avatarImageView.addGestureRecognizer(tap)
        header.avatarImageView.isUserInteractionEnabled = true
    }
    
    func setupConstrains(){
        header.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(header.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    @objc private func avatarTap(sender: UITapGestureRecognizer) {
        let overlay = OverlayView(frame: view.frame)
        view.addSubview(overlay)
        overlay.alpha = 0
        
        let avatar: UIImageView = {
            let imageView = UIImageView(image: UIImage(named: "avatarImageView"))
            imageView.layer.borderWidth = 3.0
            imageView.layer.borderColor = UIColor.white.cgColor
            imageView.layer.cornerRadius = 55
            imageView.clipsToBounds = true
            return imageView
        }()
        view.addSubview(avatar)
        
        avatar.snp.makeConstraints {
            $0.top.equalToSuperview().inset(63)
            $0.leading.equalToSuperview().inset(16)
            $0.height.equalTo(110)
            $0.width.equalTo(110)
            //            $0.center.equalToSuperview()
        }
        let button: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(named: "xmark"), for: .normal)
            button.alpha = 0
            return button
        }()
        let scale = view.frame.width / header.avatarImageView.frame.width
        UIView.animateKeyframes(withDuration: 05,
                                delay: 0.0,
                                options: .calculationModeLinear,
                                animations: {
                                    //   первая анимация
                                    UIView.addKeyframe(withRelativeStartTime: 0.0,
                                                       relativeDuration: 0.625) {
                                        overlay.alpha = 0.5
//                                        self.view.layoutIfNeeded()
                                        avatar.center = self.view.center
                                        avatar.transform = CGAffineTransform(scaleX: scale, y: scale)
                                    }
                                    
                                    
                                    
                                    //   вторая анимация
                                    UIView.addKeyframe(withRelativeStartTime: 0.5,
                                                       relativeDuration: 0.375) {
                                        self.view.addSubview(button)
                                        button.alpha = 1
                                        button.snp.makeConstraints {
                                            $0.top.trailing.equalToSuperview().inset(50)
                                            $0.height.width.equalTo(50)
                                        }
                                    }
                                })
        
    }
}

//MARK: - extention

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSourse.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.reuseId, for: indexPath) as? PhotosTableViewCell else {
                return UITableViewCell()
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.id, for: indexPath) as? PostTableViewCell else {
                return UITableViewCell()
            }
            let post = dataSourse[indexPath.row - 1]
            cell.configure(with: post)
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let photoController = PhotosViewController()
            navigationController?.pushViewController(photoController, animated: true)
        }
    }
}
