//
//  UIView+Ext.swift
//  DXC-Players
//
//  Created by Ferran Rosales on 10/1/21.
//

import UIKit

extension UIView {
    
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superview!.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superview!.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superview!.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superview!.bottomAnchor).isActive = true
    }
}
