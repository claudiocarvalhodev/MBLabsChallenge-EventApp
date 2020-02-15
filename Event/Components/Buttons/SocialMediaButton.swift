//
//  SocialMediaButton.swift
//  Event
//
//  Created by claudiocarvalho on 15/02/20.
//  Copyright © 2020 claudiocarvalho. All rights reserved.
//

import UIKit

class SocialMediaButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        layer.cornerRadius = 5.0
        backgroundColor = .white
        tintColor = UIColor.eventPurple
        imageView?.contentMode = .scaleAspectFit
        imageEdgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.black, radius: 2.0, opacity: 0.05)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

