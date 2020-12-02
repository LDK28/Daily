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
	
	func tapAnimation(_ completion: @escaping () -> Void) {
	  isUserInteractionEnabled = false
		UIView.animate(withDuration: 0.1,
					   delay: 0,
					   options: .curveLinear,
					   animations: { [weak self] in
							self?.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
		}) { done in
			UIView.animate(withDuration: 0.1,
						   delay: 0,
						   options: .curveLinear,
						   animations: { [weak self] in
								self?.transform = CGAffineTransform.init(scaleX: 1, y: 1)
			}) { [weak self] _ in
				self?.isUserInteractionEnabled = true
				completion()
			}
		}
	}
}
