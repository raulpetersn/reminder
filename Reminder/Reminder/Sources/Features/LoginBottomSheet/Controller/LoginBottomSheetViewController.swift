//
//  LoginBottomSheetViewController.swift
//  Reminder
//
//  Created by Rauls on 07/04/25.
//

import UIKit

class LoginBottomSheetViewController: UIViewController {

    let loginView =  LoginBottomSheetView()
    weak var flowDelegate:  LoginBottomSheetFlowDelegate?
    let viewModel = LoginBottomSheetViewModel()
    var mainNavigation: UINavigationController?
    var handleAreaHeight: CGFloat = 50.0
    
    
    init(flowDelegate: LoginBottomSheetFlowDelegate) {
        self.flowDelegate = flowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginView.delegate = self
        setupUI()
        setupGesture()
        bindViewModel()
    }
    
    
    private func setupUI() {
        self.view.addSubview(loginView)
        loginView.translatesAutoresizingMaskIntoConstraints = false
        setupConstrains()
    }
    
    private func setupConstrains() {
        
        self.view.addSubview(loginView)
        NSLayoutConstraint.activate([
            loginView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            loginView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        let heightConstraint = loginView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
        
        
    }
    
    private func setupGesture() {
        
    }
    
    private func handlePanGesture() {
        
    }
    
    private func bindViewModel() {
        viewModel.succesResult = { [weak self] in
            self?.flowDelegate?.navigateToHome()
        }
    }
    
     func animateShow(completion : (() -> Void)?) {
        self.view.layoutIfNeeded()
        loginView.transform = CGAffineTransform(translationX: 0, y: loginView.frame.height)
        UIView.animate(withDuration: 0.3, animations: {
            self.loginView.transform = .identity
            self.view.layoutIfNeeded()
        }) { _ in
            completion?()
            
        }
    }
    
}

extension LoginBottomSheetViewController: LoginBottomSheetViewDelegate {
    func sendLoginData(user: String, password: String) {
        viewModel.doAuth(userNameLogin: user, password: password)
    }
}
