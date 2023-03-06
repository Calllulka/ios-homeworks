//
//  ProfileViewController.swift
//  TestOne
//
//  Created by Alexander on 15.02.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let table = UITableView.init(
            frame: .zero,
            style: .plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()
    
    private enum CellReuseID: String {
        case base = "BaseTableView_ ReuseID"
        case custom = "CustomTableViewCell_ReuseID"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        view.addSubview(tableView)
        tableView.register(ProfileHeaderView.self, forCellReuseIdentifier: "ProfileHeaderView")
        tableView.dataSource = self
        makeConstraints()
    }
//
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(false, animated: true)
//    }
//
    func setupView() {
        view.backgroundColor = .blue
        navigationItem.title = "Hello world"
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func makeConstraints() {
        let safeArea = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
    
    private func tuneTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        
        let headerView = ProfileHeaderView()
        tableView.setAndLayout(headerView: headerView)
        tableView.tableFooterView = UIView()
        
        tableView.register(
            ProfileHeaderView.self,
            forCellReuseIdentifier: CellReuseID.base.rawValue
        )
        
//        tableView.dataSource.self
//        tableView.delegate.self
    }
}

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileHeaderView", for: indexPath) as? BaseTableViewCell else {
            fatalError("Kek")
        }
        
        return cell
    }
}

extension UITableView {
    func setAndLayout(headerView: UIView) {
        tableHeaderView = headerView
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.widthAnchor.constraint(equalTo: widthAnchor)
        ])
        headerView.setNeedsLayout()
        headerView.layoutIfNeeded()
        headerView.frame.size = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    }
}
