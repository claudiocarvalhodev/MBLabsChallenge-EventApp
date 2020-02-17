//
//  CreateEventViewController.swift
//  Event
//
//  Created by claudiocarvalho on 16/02/20.
//  Copyright © 2020 claudiocarvalho. All rights reserved.
//

import UIKit

class CreateEventViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var CreateEventContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .eventGrayLight
        view.layer.cornerRadius = 10
        
        let stack = UIStackView(arrangedSubviews: [logoImageView,
                                                   createEventButton])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 40
        view.addSubview(stack)
        stack.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 16, paddingRight: 16)
        return view
    }()
    
    private let logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "logo-colorful")
        image.contentMode = .scaleAspectFit
        image.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return image
    }()
    
    private let createEventButton: AuthButton = {
        let button = AuthButton(type: .system)
        button.setTitle("Create Event", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleCreateEvent), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Selectors
    
    @objc func handleCreateEvent() {
        print("Create an event")
        
        /*
        let controller = RegisterEventViewController()
        navigationController?.pushViewController(controller, animated: true)
        self.dismiss(animated: true, completion: nil)
        */
        
        DispatchQueue.main.async {
            let nav = UINavigationController(rootViewController: RegisterEventViewController())
            self.present(nav, animated: true, completion: nil)
        }
    }
    
    // MARK: - Helper Functions
    
    func configureUI() {
        view.backgroundColor = .eventPurple
        
        view.addSubview(CreateEventContainerView)
        CreateEventContainerView.anchor(top: logoImageView.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: createEventButton.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: -40, paddingLeft: 16, paddingBottom: -40, paddingRight: 16)
        CreateEventContainerView.centerY(inView: view)
        
    }
}
