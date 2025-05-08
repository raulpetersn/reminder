//
//  LoginBottomSheetViewController.swift
//  Reminder
//
//  Created by Rauls on 07/04/25.
//

import UIKit

class LoginBottomSheetViewController: UIViewController {

    let contentView: LoginBottomSheetView
    weak var flowDelegate:  LoginBottomSheetFlowDelegate?
    let viewModel = LoginBottomSheetViewModel()
    var mainNavigation: UINavigationController?
    var handleAreaHeight: CGFloat = 50.0
    
    
    init(contentView:LoginBottomSheetView, flowDelegate: LoginBottomSheetFlowDelegate) {
        self.flowDelegate = flowDelegate
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.delegate = self
        setupUI()
        setupGesture()
        bindViewModel()
    }
    
    
    private func setupUI() {
        self.view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        setupConstrains()
    }
    
    private func setupConstrains() {
        
        self.view.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        let heightConstraint = contentView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
        
        
    }
    
    private func setupGesture() {
        
    }
    
    private func handlePanGesture() {
        
    }
    
    private func bindViewModel() {
        viewModel.succesResult = { [weak self]  userNameLogin in
            self?.presentSaveLoginAlert(email: userNameLogin)
        }
        
        viewModel.errorResult = { [weak self] errorMessage in
            self?.presentErrorAlert(message: errorMessage)
        }
        
    }
    
    private func presentSaveLoginAlert(email: String) {
        let alertController = UIAlertController(title: "Salvar acesso", message: "Deseja se manter conectado", preferredStyle: .alert)
        
        let savedAction = UIAlertAction(title: "Salvar",
                                        style: .default) { _ in
            let user = User(email: email, isUserSaved: true)
            UserDefaultsManager.savedUser(user: user)
            self.flowDelegate?.navigateToHome()
        }
        
        let cancelAction = UIAlertAction(title: "Não", style: .cancel) { _ in
            self.flowDelegate?.navigateToHome()
        }
        
        alertController.addAction(savedAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true)
    }
    
    private func presentErrorAlert(message: String) {
        let alertController = UIAlertController(title: "Erro ao realizar login",
                                                message: message,
                                                preferredStyle: .alert)
        
        let retryAction = UIAlertAction(title: "Tentar novamente", style: .default)
        
        alertController.addAction(retryAction)
        self.present(alertController, animated: true)
    }
    
     func animateShow(completion : (() -> Void)?) {
        self.view.layoutIfNeeded()
        contentView.transform = CGAffineTransform(translationX: 0, y: contentView.frame.height)
        UIView.animate(withDuration: 0.3, animations: {
            self.contentView.transform = .identity
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
