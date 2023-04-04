//
//  ProfileViewController.swift
//  TestOne
//
//  Created by Alexander on 15.02.2023.
//

import UIKit
import SnapKit
import StorageService

class ProfileViewController: UIViewController {
    
    //    MARK: - Property
    
    private var dataSourse = Post.make()
    
    private var avatarOriginPoint = CGPoint()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.id)
        table.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.reuseId)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.estimatedRowHeight = 70
        return table
    }()
    
    private let avatar: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "avatarImageView"))
        imageView.layer.borderWidth = 3.0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 55
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let cross: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "xmark"), for: .normal)
        button.alpha = 0
        button.addTarget(self, action: #selector(xmark), for: .touchUpInside)
        return button
    }()
    
    private let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .extraLight))
    
    private let header = ProfileHeaderView()
    
    
    //    MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        setupConstrains()
        setupGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    //    MARK: - Function setupConstraint
    
    private func prepareView() {
        tableView.delegate = self
        tableView.dataSource = self
        #if DEBUG
        view.backgroundColor = .white
        #else
        view.backgroundColor = .black
        #endif
        view.addSubview(tableView)
        view.addSubview(header)
        view.addSubview(blurView)
        view.addSubview(avatar)
        view.addSubview(cross)
        blurView.isHidden = true
        avatar.isHidden = true
    }
    
    private func setupGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(avatarTap(sender:)))
        header.avatarImageView.addGestureRecognizer(tap)
        header.avatarImageView.isUserInteractionEnabled = true
    }
    
    func setupConstrains(){
        header.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide)
        }

        blurView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(header.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        cross.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(50)
            $0.size.equalTo(50)
        }
        
        avatar.snp.makeConstraints {
            $0.size.equalTo(110)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
    }
    
    @objc private func avatarTap(sender: UITapGestureRecognizer) {
        cross.isHidden = false
        avatar.isHidden = false
        blurView.isHidden = false
        blurView.alpha = 0
            
        avatarOriginPoint = avatar.center
        
        let scale = view.frame.width / header.avatarImageView.frame.width
        
        UIView.animateKeyframes(withDuration: 0.8,
                                delay: 0.1,
                                options: .calculationModeLinear) {
            UIView.addKeyframe(withRelativeStartTime: 0.0,
                               relativeDuration: 0.625) {
                
                self.blurView.alpha = 0.5
                self.avatar.center = CGPoint(x: UIScreen.main.bounds.midX,
                                             y: UIScreen.main.bounds.midY)
                self.avatar.transform = CGAffineTransform(scaleX: scale, y: scale)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.625,
                               relativeDuration: 0.325) {
                self.cross.alpha = 1
            }
        }
    }
    
    @objc func xmark() {
        
        UIView.animateKeyframes(withDuration: 0.8,
                                delay: 0.1,
                                options: .calculationModeLinear) {
            UIView.addKeyframe(withRelativeStartTime: 0.0,
                               relativeDuration: 0.325) {
                self.cross.alpha = 0
            }
            UIView.addKeyframe(withRelativeStartTime: 0.325,
                               relativeDuration: 0.625) {
                
                self.avatar.center = self.avatarOriginPoint
                self.blurView.alpha = 0
                self.avatar.transform = .identity
            }
        }
    }
}


//MARK: - extention

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Post.make().count + 1
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
