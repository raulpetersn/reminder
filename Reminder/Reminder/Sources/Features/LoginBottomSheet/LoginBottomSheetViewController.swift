//
//  LoginBottomSheetViewController.swift
//  Reminder
//
//  Created by Rauls on 07/04/25.
//

import UIKit

class LoginBottomSheetViewController: UIViewController {

    let loginView =  LoginBottomSheetView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    
    private func setupUI() {
        
        
        
        setupConstrains()
    }
    
    private func setupConstrains() {
        self.view.addSubview(loginView)
    }
    
}
