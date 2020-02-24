//
//  LoginViewController.swift
//  ProjectFacebookLoginNotes
//
//  Created by Ana Caroline de Souza on 22/02/20.
//  Copyright © 2020 Ana e Leo Corp. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin

class LoginViewController: UIViewController, LoginButtonDelegate {

    var coordinator: Coordinator!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        let loginButton = FBLoginButton(permissions: [.publicProfile])
        loginButton.center = view.center
        loginButton.layer.cornerRadius = 180
        loginButton.delegate = self
        view.addSubview(loginButton)
        
        if let token = AccessToken.current {
            let userId = token.userID // the uniqueness of the user - for database uses
            coordinator.goToNotesView(withUser:userId)
        }
    }
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        
        guard let fbResult = result?.token else {
            print("no permission granted")
            return
        }
        
        print("user logged \(fbResult)")
        coordinator.goToNotesView(withUser: fbResult.userID)
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("user logged out")
    }
  
    

}
