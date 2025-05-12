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
    }
    
    private func setupBindView() {
        self.view = contentView
    }
    
    private func setupConstrains() {
//        setupContentViewToBounds(contentView: contentView)
    }
}
