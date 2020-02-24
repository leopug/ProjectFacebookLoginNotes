//
//  ViewController.swift
//  ProjectFacebookLoginNotes
//
//  Created by Ana Caroline de Souza on 22/02/20.
//  Copyright © 2020 Ana e Leo Corp. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {

    var coordinator: Coordinator!
    var launchScreenTitle: UILabel!
    var loginKey = "LoginKey"
    var loginStatus: Bool? = false
    var facebookLaunchImage: UIImageView!
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        launchScreenTitle = UILabel(frame: .zero)
        launchScreenTitle.textAlignment = .center
        launchScreenTitle.translatesAutoresizingMaskIntoConstraints = false
        launchScreenTitle.font = UIFont(name: "Arial", size: 24)
        launchScreenTitle.text = "FaceNoteAPP Welcome"
        view.addSubview(launchScreenTitle)
        
        facebookLaunchImage = UIImageView(image: UIImage(named: "facebook"))
        facebookLaunchImage.translatesAutoresizingMaskIntoConstraints = false
        facebookLaunchImage.isUserInteractionEnabled = true
        view.addSubview(facebookLaunchImage)
                
        constraintsInitialization()
        
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(goToLoginViewController), userInfo: nil, repeats: false)
        
    }
    
    @objc func goToLoginViewController() {
        
        coordinator.goToLoginPage()
        
    }
    
    func constraintsInitialization() {
        
        NSLayoutConstraint.activate([
         
         launchScreenTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
         launchScreenTitle.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
         
         facebookLaunchImage.topAnchor.constraint(lessThanOrEqualTo: launchScreenTitle.bottomAnchor),
         facebookLaunchImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
         facebookLaunchImage.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
         facebookLaunchImage.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor)
         
        ])
        
    }

}

