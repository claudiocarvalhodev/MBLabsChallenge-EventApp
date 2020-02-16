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
    
    func setupViewControllers() {
        view.backgroundColor = .eventYellow
        self.delegate = self
        
        let createEvent = CreateEventViewController()
        createEvent.tabBarItem.image = #imageLiteral(resourceName: "tabbar-createevent").withRenderingMode(.alwaysOriginal)
        createEvent.tabBarItem.selectedImage = #imageLiteral(resourceName: "tabbar-createevent")
        createEvent.title = ""
        createEvent.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        let favorite = HomeViewController()
        favorite.tabBarItem.image = #imageLiteral(resourceName: "tabbar-favorite").withRenderingMode(.alwaysOriginal)
        favorite.tabBarItem.selectedImage = #imageLiteral(resourceName: "tabbar-favorite")
        favorite.title = ""
        favorite.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        let home = HomeViewController()
        home.tabBarItem.image = #imageLiteral(resourceName: "tabbar-home").withRenderingMode(.alwaysOriginal)
        home.tabBarItem.selectedImage = #imageLiteral(resourceName: "tabbar-home")
        home.title = ""
        home.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        let tickets = HomeViewController()
        tickets.tabBarItem.image = #imageLiteral(resourceName: "tabbar-ticket").withRenderingMode(.alwaysOriginal)
        tickets.tabBarItem.selectedImage = #imageLiteral(resourceName: "tabbar-ticket")
        tickets.title = ""
        tickets.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        let profile = HomeViewController()
        profile.tabBarItem.image = #imageLiteral(resourceName: "tabbar-profile").withRenderingMode(.alwaysOriginal)
        profile.tabBarItem.selectedImage = #imageLiteral(resourceName: "tabbar-profile")
        profile.title = ""
        profile.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        viewControllers = [createEvent, favorite, home, tickets, profile]
        tabBar.tintColor = .eventPurple
    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}
