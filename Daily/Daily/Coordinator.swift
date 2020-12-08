//
//  Coordinator.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//

import Foundation
import UIKit
import FirebaseAuth

protocol DailyCoordinatorProtocol {
	var mainViewController: UIViewController { get set }
	
	func authorize()
	
	func logout()
}

final class DailyCoordinator: DailyCoordinatorProtocol {
	var mainViewController: UIViewController
	
	func logout() {
		try? Auth.auth().signOut()
		let viewController = LoginVC()
		viewController.coordinator = self
		viewController.modalPresentationStyle = .fullScreen
		self.mainViewController.present(viewController,
										animated: true)
	}
		
	func authorize() {
		let viewController = DailyTabBarModule.build()
		viewController.coordinator = self
		viewController.modalPresentationStyle = .fullScreen
		self.mainViewController.present(viewController,
										animated: true)
	}
	
	func start() {
		UserRequest.shared.loadUserData { result in
			switch result {
			case .success(()):
				self.authorize()
			case .failure(let error):
				self.logout()
				debugPrint(error.localizedDescription)
			}
		}
	}
	
	init() {
		mainViewController = SpashScreenVC()
	}
}
