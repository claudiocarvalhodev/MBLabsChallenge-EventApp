//
//  CreateEventViewController.swift
//  Event
//
//  Created by claudiocarvalho on 16/02/20.
//  Copyright © 2020 claudiocarvalho. All rights reserved.
//

import UIKit

class CreateEventViewController: UIViewController {
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helper Functions
    
    func configureUI() {
        view.backgroundColor = .eventPurple
    }
}
