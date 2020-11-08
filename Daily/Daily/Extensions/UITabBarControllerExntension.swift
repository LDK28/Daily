//
//  UIViewControllerExntension.swift
//  Daily
//
//  Created by Арсений Токарев on 02.11.2020.
//

import UIKit

extension UITabBarController {
	func add(_ child: UIViewController, highestElementInTabBar element: UIView? = nil) {
		addChild(child)
		child.view.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(child.view)
		
	
		NSLayoutConstraint.activate([
			child.view.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -10 * 2),
			child.view.bottomAnchor.constraint(equalTo: element != nil ? element!.topAnchor : tabBar.topAnchor, constant: -20),
			//child.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
			child.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
			child.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			
		])
		
		child.view.layer.cornerRadius = 15
		child.didMove(toParent: self)
	}

}
