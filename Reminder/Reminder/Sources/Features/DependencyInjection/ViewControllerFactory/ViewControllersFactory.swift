//
//  ViewControllersFactory.swift
//  Reminder
//
//  Created by Rauls on 30/04/25.
//

import UIKit

final class ViewControllersFactory: ViewControllersProtocol {
    
    func makeSplashController(flowDelegate: SplashFlowDelegate) -> SplashViewController {
        let contentView = SplashView()
        let splashViewController = SplashViewController(contentView: contentView,
                                                        flowDelegate: flowDelegate)
        return splashViewController
    }
    
    func makeLoginBottomSheetViewController(flowDelegate: LoginBottomSheetFlowDelegate) -> LoginBottomSheetViewController {
        let contentView = LoginBottomSheetView()
        let loginBottomSheet = LoginBottomSheetViewController(contentView: contentView,
                                                              flowDelegate: flowDelegate)
        return loginBottomSheet
    }
    
    
}
