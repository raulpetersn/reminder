//
//  LoginBottomSheetViewDelegate.swift
//  Reminder
//
//  Created by Rauls on 13/04/25.
//

import UIKit

protocol LoginBottomSheetViewDelegate: AnyObject {
    func sendLoginData(user: String, password: String)
}
