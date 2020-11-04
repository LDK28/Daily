//
//  UIViewExtension.swift
//  Daily
//
//  Created by julie on 04.11.2020.
//

import UIKit

extension UIView {
    
    func  styleView(backgroundColor: UIColor, cornerRadius: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
    }
}
