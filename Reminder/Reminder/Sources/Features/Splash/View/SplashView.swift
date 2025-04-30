//
//  SplashView.swift
//  Reminder
//
//  Created by Rauls on 11/03/25.
//

import UIKit

class SplashView: UIView {
    
    private let logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints =  false

        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI() {
        self.backgroundColor = Colors.redBase
        self.addSubview(logoImageView)
        
        setupConstrains()
    }
    
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            logoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
    
}
