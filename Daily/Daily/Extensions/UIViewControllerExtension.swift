//
//  UIViewControllerExtension.swift
//  Daily
//
//  Created by Арсений Токарев on 02.11.2020.
//

import UIKit

extension UIViewController {
	func remove() {

		UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
			self.view.frame.origin.y -= 15
			self.view.alpha = 0
			
		}) { _ in
			self.willMove(toParent: nil)
			self.view.removeFromSuperview()
			self.removeFromParent()
		}
	}
}
