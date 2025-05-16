//
//  HomeView.swift
//  Reminder
//
//  Created by Rauls on 08/05/25.
//

import UIKit

class HomeView: UIView {
    
    private let profileBackground: UIView =  {
        let view = UIView()
        view.backgroundColor = Colors.gray600
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let contentBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = Metrics.medium
        view.layer.masksToBounds = true
        view.backgroundColor = Colors.gray800
        view.clipsToBounds = true
        return view
    }()
    
    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .green
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = Metrics.regular
        imageView.image = UIImage(named: "profile-picture")
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Boas vindas"
        label.textColor = Colors.gray200
        label.font = Typography.label
        return label
    }()
    
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Julio Santana"
        label.textColor = Colors.gray100
        label.font = Typography.heading
        return label
    }()
    
    private let feedbackButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Avaliar", for: .normal)
        button.layer.cornerRadius = Metrics.medium
        button.backgroundColor = Colors.gray100
        button.titleLabel?.font = Typography.subHeading
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(profileBackground)
        addSubview(profileImage)
        addSubview(welcomeLabel)
        addSubview(nameLabel)
        addSubview(contentBackground)
        addSubview(feedbackButton)
        
        setupConstrains()
    }
    
    private func setupConstrains() {
        
        NSLayoutConstraint.activate([

            profileBackground.topAnchor.constraint(equalTo: self.topAnchor),
            profileBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            profileBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            profileBackground.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            profileImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            profileImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.regular),
            profileImage.widthAnchor.constraint(equalToConstant: Metrics.imageProfileSize),
            profileImage.heightAnchor.constraint(equalToConstant: Metrics.imageProfileSize),
            
            welcomeLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 16),
            welcomeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.regular),
            
            nameLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: Metrics.little),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.regular),
            
            contentBackground.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Metrics.regular),
            contentBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentBackground.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            feedbackButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            feedbackButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.regular),
            feedbackButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.regular),
            feedbackButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize)
            
            
        ])
    }
}
