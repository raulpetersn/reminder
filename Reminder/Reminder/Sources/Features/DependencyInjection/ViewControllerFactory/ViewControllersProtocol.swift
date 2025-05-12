//
//  ViewControllersProtocol.swift
//  Reminder
//
//  Created by Rauls on 30/04/25.
//

protocol ViewControllersProtocol: AnyObject {
    func makeSplashController(flowDelegate: SplashFlowDelegate) -> SplashViewController
    func makeLoginBottomSheetViewController(flowDelegate: LoginBottomSheetFlowDelegate) -> LoginBottomSheetViewController
    func makeHomeViewController(flowDelegate: HomeFlowDelegate) -> HomeViewController
}
 
