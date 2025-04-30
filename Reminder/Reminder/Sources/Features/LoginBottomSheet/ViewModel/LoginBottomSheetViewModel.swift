//
//  LoginBottomSheetViewModel.swift
//  Reminder
//
//  Created by Rauls on 27/04/25.
//

import Firebase

class LoginBottomSheetViewModel {
    var succesResult: (() -> Void)?
    
    func doAuth(userNameLogin: String, password: String ) {
        Auth.auth().signIn(withEmail: userNameLogin, password: password) { [weak self] authResult, error in
            
            if let error = error {
                print("Autenticacao nao foi com sucesso \(error)")
            } else {
                self?.succesResult?()
                print("deu bom no login \(authResult)")
            }
        }
    }
    
}
