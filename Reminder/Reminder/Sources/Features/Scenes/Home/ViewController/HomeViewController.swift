//
//  Untitled.swift
//  Reminder
//
//  Created by Rauls on 08/05/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    var contentView: HomeView
    weak var flowDelegate: HomeFlowDelegate?
    
    init(contentView: HomeView, flowDelegate: HomeFlowDelegate) {
        self.contentView = contentView
        self.flowDelegate = flowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindView()
        setupConstrains()
        setupNavigationBar()
    }
    
    private func setupBindView() {
        self.view = contentView
    }
    
    private func setupConstrains() {
//        setupContentViewToBounds(contentView: contentView)
    }
    
    private func setupNavigationBar() {
        let logoutButton = UIBarButtonItem(image: UIImage(named: "log-out-icon"),
                                           style: .plain,
                                           target: self,
                                           action: #selector(didClickLogOut))
        logoutButton.tintColor = Colors.redBase
        navigationItem.rightBarButtonItem = logoutButton
        navigationController?.navigationBar.isHidden = false
        navigationItem.hidesBackButton = true
    
    }
    
    @objc
    private func didClickLogOut() {
        UserDefaultsManager.removeUser()
        flowDelegate?.logout()
    }
}
