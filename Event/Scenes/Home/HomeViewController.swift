//
//  HomeViewController.swift
//  Event
//
//  Created by claudiocarvalho on 16/02/20.
//  Copyright © 2020 claudiocarvalho. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedIn()
        //signOut()
    }
    
    // MARK: - API
    
    func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser?.uid == nil {
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: LoginViewController())
                self.present(nav, animated: true, completion: nil)
            }
        } else {
            configureUI()
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("DEBUG: Error signing out")
        }
    }
    
    // MARK: - Helper Functions
    
    func configureUI() {
        view.backgroundColor = .eventYellow
    }
}
