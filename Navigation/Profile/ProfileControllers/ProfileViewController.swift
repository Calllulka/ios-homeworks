//
//  ProfileViewController.swift
//  TestOne
//
//  Created by Alexander on 15.02.2023.
//

import UIKit

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
    
//    MARK: - LifeCycle
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupConstrains()
        setupTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    //    MARK: - Function setupConstraint
    
    func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupConstrains(){
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor)
            
        ])
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ProfileHeaderView(reuseIdentifier: ProfileHeaderView.identifier)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        необходима корректировка
        return 225
    }
}
