//
//  Coordinator.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//

import Foundation
import UIKit

protocol DailyCoordinatorProtocol {
	var navigationController: UINavigationController { get set }
	
	func authorize()
	
	func logout()
}

final class DailyCoordinator: DailyCoordinatorProtocol {
	var navigationController: UINavigationController
	
	func logout() {
		let loginVC = LoginVC()
		loginVC.coordinator = self
		navigationController.pushViewController(loginVC,
												animated: true)
		navigationController.viewControllers.removeFirst()
	}
		
	func authorize() {
		let appVC = DailyTabBarModule.build()
		//appVC.coordinator = self
		navigationController.pushViewController(appVC,
												animated: true)
		navigationController.viewControllers.removeFirst()
	}
	
	init() {
		navigationController = UINavigationController(rootViewController: SpashScreenVC())
		navigationController.setNavigationBarHidden(true, animated: false)
		
		UserRequest.shared.loadUserData { result in
			switch result {
			case .success(()):
				let viewController = DailyTabBarModule.build()
			//	viewController.coordinator = self
				viewController.modalPresentationStyle = .fullScreen
				self.navigationController.pushViewController(viewController,
															 animated: true)
			case .failure(let error):
				let viewController = LoginVC()
			//	viewController.coordinator = self
				self.navigationController.pushViewController(viewController,
															 animated: true)
				debugPrint(error.localizedDescription)
			}
			self.navigationController.viewControllers.removeFirst()
		}
	}
}
