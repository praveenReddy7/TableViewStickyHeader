//
//  HeaderView.swift
//  TableViewStickyHeader
//
//  Created by praveen on 3/15/19.
//  Copyright © 2019 DemoApps. All rights reserved.
//

import UIKit

class HeaderView: UIView {
    let logo = UILabel()
    var logoWidthConstraint: NSLayoutConstraint!
    var logoHightConstraint: NSLayoutConstraint!
    var logoYPosition: NSLayoutConstraint!
    let titleLabel = UILabel()

    init() {
        super.init(frame: .zero)
        
        logo.text = "P"
        logo.textAlignment = .center
        logo.font = UIFont.systemFont(ofSize: 45, weight: .semibold)
        logo.clipsToBounds = true
        logo.layer.cornerRadius = 45
        logo.backgroundColor = .white
        logo.translatesAutoresizingMaskIntoConstraints = false
        addSubview(logo)
        
        
        logo.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        logoYPosition = logo.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -20)
        logoYPosition.isActive = true
        logoWidthConstraint = logo.widthAnchor.constraint(equalToConstant: 90)
        logoWidthConstraint.isActive = true
        logoHightConstraint = logo.heightAnchor.constraint(equalToConstant: 90)
        logoHightConstraint.isActive = true
        
        titleLabel.text = "Demo"
        titleLabel.clipsToBounds = true
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        titleLabel.textAlignment = .center
        
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        titleLabel.topAnchor.constraint(equalTo: logo.bottomAnchor).isActive = true
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
