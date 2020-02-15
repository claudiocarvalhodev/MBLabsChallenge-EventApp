//
//  SignUpViewController.swift
//  Event
//
//  Created by claudiocarvalho on 14/02/20.
//  Copyright © 2020 claudiocarvalho. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helper Functions
    
    func configureUI() {
        configureNavigationBar()
        view.backgroundColor = .eventYellow
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
}

