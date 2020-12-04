//
//  TabBarControllerWithMiddleButton.swift
//  Daily
//
//  Created by Арсений Токарев on 02.11.2020.
//

import UIKit

class TabBarControllerWithMiddleButton: UITabBarController, UITabBarControllerDelegate {
	private static var numberOfTabs = 0
	
    override func loadView() {
        super.loadView()
		configureTabBar()
		NSLayoutConstraint.activate([
			self.tabBar.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
			self.tabBar.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
			self.tabBar.widthAnchor.constraint(equalToConstant: tabBar.frame.width),
			self.tabBar.heightAnchor.constraint(equalTo: tabBar.heightAnchor), // Fixed height for nav menu
			self.tabBar.bottomAnchor.constraint(equalTo: tabBar.bottomAnchor)
		])
    }
	
	override func viewDidLoad() {
		super.viewDidLoad()
		delegate = self
	}

	func layoutMiddleButton(button: UIButton) {
		let multiplier: CGFloat = 0.8
		let size = tabBar.frame.size.height * multiplier
		
		NSLayoutConstraint.activate([
			button.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
			button.centerYAnchor.constraint(equalTo: tabBar.safeAreaLayoutGuide.centerYAnchor),
			button.heightAnchor.constraint(equalToConstant: size),
			button.widthAnchor.constraint(equalTo: button.heightAnchor)
		])
	}

	func configureTabBar() {
		let styling = tabBar
		styling.isTranslucent = false
		styling.tintColor = .dailyTabBarSelectedItemColor
		styling.unselectedItemTintColor = .dailyTabBarItemColor
		styling.barTintColor = .dailyTabBarColor
		styling.shadowImage = nil
		styling.setValue(true, forKey: "hidesShadow")
		let systemFontAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]
		UITabBarItem.appearance().setTitleTextAttributes(systemFontAttributes, for: .normal)
		self.viewControllers = [
			createNavigationController(for: DiaryVC(),
									   withTitle: NSLocalizedString("Diary", comment: ""),
									   withImage: "note.text.badge.plus"),
			
			createNavigationController(for: IdeasModule.build(),
									   withTitle: NSLocalizedString("Ideas", comment: ""),
									   withImage: "note"),
			
			createNavigationController(for: UIViewController(),
									   withTitle: "",
									   withImage: ""),
			
			createNavigationController(for: CalendarVC(),
									   withTitle: NSLocalizedString("Calendar", comment: ""),
									   withImage: "calendar.circle.fill"),
			
			createNavigationController(for: UserInfoVC(),
									   withTitle: NSLocalizedString("Profile", comment: ""),
									   withImage: "person.crop.circle"),
			
		]
	}
	
	func createNavigationController(for viewController: UIViewController,
									withTitle title: String,
									withImage imageName: String) -> UINavigationController {
		viewController.title = nil
		viewController.tabBarItem = UITabBarItem(title: title,
												 image: UIImage(systemName: imageName),
												 tag: TabBarControllerWithMiddleButton.numberOfTabs)
		TabBarControllerWithMiddleButton.numberOfTabs += 1
		let navigationController = UINavigationController(rootViewController: viewController)
		navigationController.setNavigationBarHidden(true, animated: false)
		return navigationController
	}
	
	func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
		guard
			let viewControllers = tabBarController.viewControllers else { return false }
		
		let middleElementIndex = (viewControllers.startIndex + viewControllers.endIndex) / 2
		let vcToSkip = viewControllers[middleElementIndex]
		
		if viewController === vcToSkip {
			return false
		}
		
		return true
	}

}
