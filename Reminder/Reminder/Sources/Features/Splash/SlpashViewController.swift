//
//  SlpashViewController.swift
//  Reminder
//
//  Created by Rauls on 11/03/25.
//

import UIKit

class SplashViewController: UIViewController {

    let contentView = SplashView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        self.view.addSubview(contentView)
        self.navigationController?.navigationBar.isHidden = true
        setupConstrains()
        setupGesture()
    }
    
    private func setupConstrains() {
        
        NSLayoutConstraint.activate([
            
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

        ])
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
      
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showLoginBottomSheet))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func showLoginBottomSheet() {
        let loginBottomSheet = LoginBottomSheetViewController()
        loginBottomSheet.modalPresentationStyle = .overFullScreen
        loginBottomSheet.modalTransitionStyle = .crossDissolve
        self.present(loginBottomSheet, animated: false) {
            loginBottomSheet.animateShow {
                
            }
        }
    }
    
}
