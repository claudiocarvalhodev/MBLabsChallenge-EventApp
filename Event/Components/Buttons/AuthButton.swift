//
//  AuthButton.swift
//  Event
//
//  Created by claudiocarvalho on 14/02/20.
//  Copyright © 2020 claudiocarvalho. All rights reserved.
//

import UIKit

class AuthButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setTitleColor(UIColor(white: 1, alpha: 1.0), for: .normal)
        backgroundColor = .eventPurple
        layer.cornerRadius = 5
        heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

