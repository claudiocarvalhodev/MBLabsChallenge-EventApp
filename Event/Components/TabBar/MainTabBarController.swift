//
//  MainTabBarController.swift
//  Event
//
//  Created by claudiocarvalho on 16/02/20.
//  Copyright © 2020 claudiocarvalho. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
    }
    
    // MARK: - Helper Functions
    
    private func setupViewControllers() {
        
        let home = HomeViewController()
        home.tabBarItem.image = #imageLiteral(resourceName: "email-icon").withRenderingMode(.alwaysOriginal)
        home.tabBarItem.selectedImage = #imageLiteral(resourceName: "email-icon").withRenderingMode(.alwaysOriginal)
        
        viewControllers = [home]
    }
}
