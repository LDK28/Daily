//
//  UIViewExtension.swift
//  Daily
//
//  Created by julie on 04.11.2020.
//

import UIKit

extension UIView {
    
    func  styleView(backgroundColor: UIColor, cornerRadius: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = backgroundColor
        layer.cornerRadius = cornerRadius
    }
    func addShadow() {
        layer.shadowColor = UIColor.dailyShadowColor
        layer.shadowOpacity = 0.05
        layer.shadowOffset = CGSize(width: 0, height: 10)
        layer.shadowRadius = 4
    }
}
