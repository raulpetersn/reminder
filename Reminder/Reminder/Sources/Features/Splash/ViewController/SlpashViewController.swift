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
        setupGesture()
        setupView()
        startBreathAnimation()
    }
    
    private func setupView() {
        self.view.addSubview(contentView)
        self.navigationController?.navigationBar.isHidden = true
        setupConstrains()
    }
    
    private func setupConstrains() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

        ])
      
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showLoginBottomSheet))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func showLoginBottomSheet() {
        self.flowDelegate?.openLoginBottomSheet()
    }
    
    private func decideNavigateFlow() {
        if let user = UserDefaultsManager.loadUser(), user.isUserSaved {
            flowDelegate?.openHome()
        } else {
            animateLogoUp()
            flowDelegate?.openLoginBottomSheet()
        }
    }
    
}

//MARK: - Animations
extension SplashViewController {
    
    private func startBreathAnimation() {
        UIView.animate(withDuration: 1.5, animations: {
            self.contentView.logoImageView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }, completion: { _ in
            self.decideNavigateFlow()
        })
    }
    
    private func animateLogoUp() {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [.curveEaseOut],
                       animations: {
            self.contentView.logoImageView.transform = self.contentView.logoImageView.transform.translatedBy(x: 0, y: -100)
        })
    }
    
}
