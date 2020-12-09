//
//  ProfileRouter.swift
//  Daily
//
//  Created by Арсений Токарев on 09.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

protocol ProfileRoutingLogic {
	func navigateTo(viewController: UIViewController)
}

class ProfileRouter {
	weak var viewController: ProfileTableVC?
	
	init(viewController: ProfileTableVC?) {
		self.viewController = viewController
	}
}

extension ProfileRouter: ProfileRoutingLogic {
	func navigateTo(viewController: UIViewController) {
		self.viewController?.navigationController?.pushViewController(viewController,
																	  animated: true)
	}
}
