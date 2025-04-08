//
//  LoginBottomSheetView.swift
//  Reminder
//
//  Created by Rauls on 07/04/25.
//

import UIKit

class LoginBottomSheetView: UIView {
    
    private let handleArea: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.gray800
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel ()
        label.text = "Entre para acessar suas receitas"
        label.textColor = Colors.gray100
        label.font = Typography.subHeading
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "email@exemplo.com"
        textField.borderStyle = .roundedRect
        textField.font = Typography.label
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "senha"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.font = Typography.label
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private let loginButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Entrar", for: .normal)
        btn.backgroundColor = Colors.redBase
        btn.layer.cornerRadius = Metrics.tiny
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .white
        self.layer.cornerRadius = Metrics.small
        
        addSubview(titleLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        
        setupConstrains()
    }
    
    private func setupConstrains() {
        
        NSLayoutConstraint.activate([
            handleArea.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.small),
            handleArea.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            handleArea.widthAnchor.constraint(equalTo: self.widthAnchor),
            handleArea.heightAnchor.constraint(equalTo: self.heightAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: handleArea.bottomAnchor, constant: Metrics.medium),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            
            emailTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.medium),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Metrics.medium),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: Metrics.medium),
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        
    }
    
}
