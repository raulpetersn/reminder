//
//  ReminderCoordinator.swift
//  Reminder
//
//  Created by Rauls on 29/04/25.
//

import UIKit

class ReminderFlowController {
    //MARK: - Properties
    private var navigationController: UINavigationController?

    //MARK: - Init
    init() {
            
    }
    
    func start() -> UINavigationController? {
        let startViewController = SplashViewController(flowDelegate: self)
        self.navigationController = UINavigationController(rootViewController: startViewController)
        
        return navigationController
    }

}

//MARK: - Login
extension ReminderFlowController: LoginBottomSheetFlowDelegate {
    
    func navigateToHome() {
        self.navigationController?.dismiss(animated: true)
        let viewController = UIViewController()
        viewController.view.backgroundColor = .red
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}


//MARK: - Splash
extension ReminderFlowController: SplashFlowDelegate {
    func openLoginBottomSheet() {
        let loginBottomSheet = LoginBottomSheetViewController(flowDelegate: self)
        loginBottomSheet.mainNavigation = self.navigationController
        loginBottomSheet.modalPresentationStyle = .overFullScreen
        loginBottomSheet.modalTransitionStyle = .crossDissolve
        
        self.navigationController?.present(loginBottomSheet, animated: false) {
            loginBottomSheet.animateShow {
                
            }
        }
    }
    
    
}
