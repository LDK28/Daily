//
//  UIViewControllerExntension.swift
//  Daily
//
//  Created by Арсений Токарев on 02.11.2020.
//

import UIKit

extension UITabBarController {
	func add(_ child: UIViewController) {
		addChild(child)
		child.view.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(child.view)
		child.view.alpha = 0
		child.view.layer.cornerRadius = 15
		
		NSLayoutConstraint.activate([
			child.view.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -10 * 2),
			child.view.bottomAnchor.constraint(equalTo: tabBar.topAnchor, constant: -30),
			child.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
			child.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			
		])
		child.didMove(toParent: self)
		child.view.frame.origin.y += 30
		
		UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
			child.view.alpha = 1
			child.view.frame.origin.y -= 15
		}) { _ in
		}
		
	}

}
