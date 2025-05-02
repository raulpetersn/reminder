//
//  SlpashViewController.swift
//  Reminder
//
//  Created by Rauls on 11/03/25.
//

import UIKit

class SplashViewController: UIViewController {

    let contentView: SplashView
    weak var flowDelegate: SplashFlowDelegate?

    
    init(contentView: SplashView,flowDelegate: SplashFlowDelegate) {
        self.contentView = contentView
        self.flowDelegate = flowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        self.flowDelegate?.openLoginBottomSheet()
    }
    
}
