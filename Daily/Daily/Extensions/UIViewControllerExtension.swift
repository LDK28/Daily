//
//  UIViewControllerExtension.swift
//  Daily
//
//  Created by Арсений Токарев on 02.11.2020.
//

import UIKit

extension UIViewController {
	func remove() {
		willMove(toParent: nil)
		view.removeFromSuperview()
		removeFromParent()
	}
}
