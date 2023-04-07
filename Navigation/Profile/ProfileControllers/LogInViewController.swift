//
//  LogInViewController.swift
//  TestOne
//
//  Created by Alexander on 23.02.2023.
//

import UIKit
import SnapKit

class LogInViewController: UIViewController {
    
    // MARK: - Property
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .white
        
        return scrollView
    }()
    
    private lazy var logo: UIImageView = {
        var logo = UIImageView(image: UIImage(named: "logo"))
        return logo
    }()
    
    private lazy var authorization: UIStackView = {
        let authorization = UIStackView()
        
        var login: UITextField = {
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
        
        var password: UITextField = {
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
        button.layer.cornerRadius = 10
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonTouch), for: .touchUpInside)
        return button
    }()
    
    //    MARK: - LifeCycle
    
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeKeyboardObservers()
    }
    
    //    MARK: - Methods
    
    func makeConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        logo.snp.makeConstraints {
            $0.size.equalTo(100)
            $0.centerX.equalTo(scrollView.snp.centerX)
            $0.top.equalTo(scrollView.snp.top).inset(120)
        }
        authorization.snp.makeConstraints {
            $0.top.equalTo(logo.snp.bottom).offset(120)
            $0.left.equalTo(scrollView.snp.left).inset(16)
            $0.width.equalTo(scrollView.snp.width).offset(-32)
            $0.height.equalTo(100)
        }
        button.snp.makeConstraints {
            $0.top.equalTo(authorization.snp.bottom).offset(16)
            $0.left.equalTo(scrollView.snp.left).inset(16)
            $0.width.equalTo(scrollView.snp.width).offset(-32)
            $0.height.equalTo(50)
            $0.bottom.equalTo(scrollView.snp.bottom)
        }
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
    }
    
    @objc func willHideKeyboard(_ notification: NSNotification) {
        scrollView.contentInset.bottom = 0.0
    }
    
    private func removeKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
}

//    MARK: - Extension

extension LogInViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(
        _ textField: UITextField
    ) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
