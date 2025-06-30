//
//  LoginBottomSheetView.swift
//  Reminder
//
//  Created by Ian Costa on 16/06/25.
//

import Foundation
import UIKit

class LoginBottomSheetView: UIView {
    public weak var delegate: LoginBottomSheetViewDelegate?
    
//    private let handleArea: UIView = {
//        let view = UIView()
//        view.backgroundColor = .lightGray
//        view.layer.cornerRadius = Metrics.tiny
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "login.label.title".localized
        label.font = Typography.subHeading
        label.textAlignment = .center
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailTextFieldLabel: UILabel = {
        let label = UILabel()
        label.text = "login.email.label".localized
        label.font = Typography.body
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let passwordTextFieldLabel: UILabel = {
        let label = UILabel()
        label.text = "login.password.label".localized
        label.font = Typography.body
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Logo")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let emailTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "login.email.placeholder".localized
        text.borderStyle = .roundedRect
        text.keyboardType = .emailAddress
        text.autocapitalizationType = .none
//        text.layer.borderWidth = 1
//        text.layer.cornerRadius = Metrics.medium
        
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let passwordTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "login.password.placeholder".localized
        text.borderStyle = .roundedRect
        text.isSecureTextEntry = true
        
//        text.rightView = UIImageView(image: UIImage(systemName: "eye"))
//        text.rightViewMode = .always
        text.leftView?.leadingAnchor.constraint(equalTo: text.leadingAnchor, constant: Metrics.small).isActive = true
        text.leftViewMode = .always
        
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("login.button.title".localized, for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = Typography.subHeading
        button.backgroundColor = Colors.primaryRedBase
        button.layer.cornerRadius = Metrics.buttonSize / 2
        button.translatesAutoresizingMaskIntoConstraints = false
                
        return button
    }()

    override init (frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
        loginButton.addTarget(self, action: #selector(logingButtonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .white
        self.layer.cornerRadius = Metrics.medium

//        addSubview(handleArea)
        addSubview(titleLabel)
        addSubview(emailTextFieldLabel)
        addSubview(emailTextField)
        addSubview(passwordTextFieldLabel)
        addSubview(passwordTextField)
        addSubview(loginButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
//            handleArea.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.small),
//            handleArea.centerXAnchor.constraint(equalTo: centerXAnchor),
//            handleArea.widthAnchor.constraint(equalToConstant: 40),
//            handleArea.heightAnchor.constraint(equalToConstant: 6),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.huge),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            
            emailTextFieldLabel.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -Metrics.small),
            emailTextFieldLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            
            emailTextField.bottomAnchor.constraint(equalTo: passwordTextFieldLabel.topAnchor, constant: -Metrics.medium),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.medium),
            emailTextField.heightAnchor.constraint(equalToConstant: Metrics.inputSize),
            
            passwordTextFieldLabel.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -Metrics.small),
            passwordTextFieldLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            
            passwordTextField.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -Metrics.giant),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.medium),
            passwordTextField.heightAnchor.constraint(equalToConstant: Metrics.inputSize),

            loginButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Metrics.huge),
            loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.medium),
            loginButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize)
        ])
    }
    
    @objc
    private func logingButtonTapped() {
        guard let email = emailTextField.text,
              let password = passwordTextField.text
        else { return }
        
        delegate?.sendLoginData(email: email, password: password)
    }
}
