//
//  AppStatusSwitcher.swift
//  Daily
//
//  Created by Арсений Токарев on 09.12.2020.
//

import UIKit
import FirebaseAuth

protocol AppSwitcherProtocol {
	func updateRootVC()
	func start()
}

class AppStatusSwitcher: AppSwitcherProtocol {
	static let shared: AppSwitcherProtocol = AppStatusSwitcher()
	static var currentVC: UIViewController = SpashScreenVC()
	
	private static var isLogged = false
	
	func updateRootVC() {
		AppStatusSwitcher.isLogged.toggle()
		if AppStatusSwitcher.isLogged {
			UserRequest.shared.loadUserData { _ in
				let viewController = DailyTabBarModule.build()
				viewController.modalPresentationStyle = .fullScreen
				AppStatusSwitcher.currentVC.dismiss(animated: true, completion: nil)
				AppStatusSwitcher.currentVC.present(viewController, animated: true, completion: nil)
			}
		} else {
			let viewController = LoginVC()
			viewController.modalPresentationStyle = .fullScreen
			AppStatusSwitcher.currentVC.dismiss(animated: true, completion: nil)
			AppStatusSwitcher.currentVC.present(viewController, animated: true, completion: nil)
		}
	}
	
	func start() {
		UserRequest.shared.loadUserData { result in
			let viewController: UIViewController
			switch result {
			case .success(()):
				viewController = DailyTabBarModule.build()
				AppStatusSwitcher.isLogged = true
			case .failure(_):
				viewController = LoginVC()
				AppStatusSwitcher.isLogged = false
			}
			viewController.modalPresentationStyle = .fullScreen
			AppStatusSwitcher.currentVC.dismiss(animated: true, completion: nil)
			AppStatusSwitcher.currentVC.present(viewController, animated: true, completion: nil)
		}
	}
	
	private init() {}
}
