//
//  String+Ext.swift
//  Reminder
//
//  Created by Rauls on 12/04/25.
//
import UIKit

//extension String {
//    
//    var localized: String {
//        return NSLocalizedString(self, comment: "")
//    }
//}
//
//import Foundation

final class Localized {
    static var bundle: Bundle {
        Bundle(for: Localized.self)
    }
   
}

extension Localized {
    static private var table: String { "Reminder" }
    
    static var loginLabelTittle: String {
        return NSLocalizedString("login.label.tittle", tableName: table, bundle: bundle, comment: "")
    }
    
    static var loginLabelEmail: String {
        return NSLocalizedString("login.label.email", tableName: table, bundle: bundle, comment: "")
    }
    
    static var loginLabelPasswordUppercase: String {
        return NSLocalizedString("login.label.password.uppercase", tableName: table, bundle: bundle, comment: "")
    }
    
    static var loginEmailPlaceholder: String {
        return NSLocalizedString("login.email.placeholder", tableName: table, bundle: bundle, comment: "")
    }
    
    static var loginLabelPassword: String {
        return NSLocalizedString("login.label.password", tableName: table, bundle: bundle, comment: "")
    }
    
    static var loginButtonTittle: String {
        return NSLocalizedString("login.button.tittle", tableName: table, bundle: bundle, comment: "")
    }

    
}
