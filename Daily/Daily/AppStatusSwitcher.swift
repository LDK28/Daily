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
	
	private static var isLogged = false {
		didSet {
			let viewController: UIViewController
			if isLogged {
				viewController = DailyTabBarModule.build()
			} else {
				try? Auth.auth().signOut()
				viewController = LoginVC()
			}
			viewController.modalPresentationStyle = .fullScreen
			AppStatusSwitcher.currentVC.present(viewController, animated: true, completion: nil)
		}
	}
	
	func updateRootVC() {
		AppStatusSwitcher.isLogged.toggle()
	}
	
	func start() {
		UserRequest.shared.loadUserData { result in
			switch result {
			case .success(()):
				AppStatusSwitcher.isLogged = true
			case .failure(_):
				AppStatusSwitcher.isLogged = false
			}
		}
	}
	
	private init() {}
}
