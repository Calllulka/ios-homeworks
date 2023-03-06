//
//  LogInViewController.swift
//  TestOne
//
//  Created by Alexander on 23.02.2023.
//

import UIKit

class LogInViewController: UIViewController {
    
    // MARK: - Private property
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()

        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .white

        scrollView.translatesAutoresizingMaskIntoConstraints = false

        return scrollView
    }()

    private lazy var logo: UIImageView = {
        var logo = UIImageView(image: UIImage(named: "logo"))
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    
    private lazy var login: UITextField = {
       let login = UITextField()
        login.textColor = .black
        login.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        login.autocapitalizationType = .none
        login.tintColor = .black
        login.backgroundColor = .systemGray6
        login.placeholder = "Email or phone"
        login.leftViewMode = .always
        login.leftView = UIView(frame: .init(x: 0, y: 0, width: 10, height: 1))
        login.rightViewMode = .always
        login.rightView = UIView(frame: .init(x: 0, y: 0, width: 10, height: 1))
        login.returnKeyType = UIReturnKeyType.done
        login.keyboardType = .default
        login.delegate = self
        return login
    }()
    
    private lazy var password: UITextField = {
       let password = UITextField()
        password.textColor = .black
        password.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        password.autocapitalizationType = .none
        password.tintColor = .black
        password.isSecureTextEntry = true
        password.backgroundColor = .systemGray6
        password.placeholder = "Password"
        password.leftViewMode = .always
        password.leftView = UIView(frame: .init(x: 0, y: 0, width: 10, height: 1))
        password.rightViewMode = .always
        password.rightView = UIView(frame: .init(x: 0, y: 0, width: 10, height: 1))
        password.returnKeyType = UIReturnKeyType.done
        password.keyboardType = .default
        password.delegate = self
        return password
    }()
    
    private lazy var authorization: UIStackView = {
       let authorization = UIStackView()
        authorization.translatesAutoresizingMaskIntoConstraints = false
        authorization.clipsToBounds = true
        authorization.layer.cornerRadius = 10
        authorization.layer.borderColor = UIColor.lightGray.cgColor
        authorization.layer.borderWidth = 0.5
        authorization.backgroundColor = .lightGray
        
        authorization.axis = .vertical
        authorization.alignment = .fill
        authorization.distribution = .fillEqually
        authorization.spacing = 0.5
        
        authorization.addArrangedSubview(login)
        authorization.addArrangedSubview(password)
        return authorization
    }()
    
    private lazy var button: UIButton = {
       let button = UIButton()
        button.backgroundColor = UIColor(named: "MyColor")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonTouch), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(logo)
        scrollView.addSubview(authorization)
        scrollView.addSubview(button)
        makeConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupKeyboardObservers()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
//    alfnkwnfbkj
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeKeyboardObservers()
    }
    
//    MARK: - Methods
    
    func makeConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        logo.widthAnchor.constraint(equalToConstant: 100).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 100).isActive = true
        logo.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        logo.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 120).isActive = true
        
        authorization.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 120).isActive = true
        authorization.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        authorization.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32).isActive = true
        authorization.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        button.topAnchor.constraint(equalTo: authorization.bottomAnchor, constant: 16).isActive = true
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        button.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.bottomAnchor.constraint(greaterThanOrEqualTo: scrollView.bottomAnchor).isActive = true
//
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    @objc func buttonTouch() {
        let profileViewController = ProfileViewController()
        navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    func setupKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willShowKeyboard(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willHideKeyboard(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    @objc func willShowKeyboard(_ notification: NSNotification) {
        let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
        scrollView.contentInset.bottom = keyboardHeight ?? 0
        
//        button.contentInset.bottom += keyboardHeight ?? 0.0
    }
    
    @objc func willHideKeyboard(_ notification: NSNotification) {
        scrollView.contentInset.bottom = 0.0
    }
    
    private func removeKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
}

extension LogInViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(
        _ textField: UITextField
    ) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
