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
    
    private var viewModel: ProfileViewModelProtocol
    private var avatarOriginPoint = CGPoint()
    private var posts: [Post] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.id)
        table.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.reuseId)
        table.estimatedRowHeight = 70
        return table
    }()
    
    private let avatar: UIImageView = {
        var imageView = UIImageView()
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
    
    init(viewModel: ProfileViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        setupConstrains()
        setupGesture()
        bind()
        viewModel.updateState(viewInput: .needData)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    //    MARK: - Function setupConstraint
    
    private func prepareView() {
        header.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        #if DEBUG
        view.backgroundColor = .orange
        #else
        view.backgroundColor = .white
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
    
    private func bind() {
        viewModel.onStateDidChange = { [weak self] state in
            guard let self = self else { return }
            
            switch state {
            case .setUserData(let user):
                self.prepareHeader(user: user)
            case .setPostsData(let posts):
                self.posts = posts
            case .statusDidChanged(let statusText):
                self.header.statusLabel.text = statusText
            }
        }
    }
    
    
    private func prepareHeader(user: User) {
        avatar.image = user.avatar
        header.avatarImageView.image = user.avatar
        header.fullNameLabel.text = user.name
        header.statusLabel.text = user.status
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
        posts.count + 1
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
            let post = posts[indexPath.row - 1]
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

extension ProfileViewController: HeaderDelegate {
    func statusDidChanged(text: String?) {
        viewModel.updateState(viewInput: .statusDidChanged(text))
    }
}
