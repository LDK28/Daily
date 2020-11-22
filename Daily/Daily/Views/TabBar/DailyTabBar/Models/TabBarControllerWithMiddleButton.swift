//
//  TabBarControllerWithMiddleButton.swift
//  Daily
//
//  Created by Арсений Токарев on 02.11.2020.
//

import UIKit

class TabBarControllerWithMiddleButton: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
		configureTabBar()
    }
    
	func layoutMiddleButton(button: UIButton) {
		
		let multiplier: CGFloat = 1.15
		let size = tabBar.frame.size.height * multiplier
		
		NSLayoutConstraint.activate([
			button.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
			button.centerYAnchor.constraint(equalTo: tabBar.safeAreaLayoutGuide.topAnchor, constant: -5),
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
		let systemFontAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]
		UITabBarItem.appearance().setTitleTextAttributes(systemFontAttributes, for: .normal)

	
		self.viewControllers = [createDiaryNC(), createIdeasNC(), createCalendarNC(), createProfileNC()]
	}
	
	func createDiaryNC() -> UINavigationController {
	
		let diaryVC = DiaryVC()
		diaryVC.title = nil
		diaryVC.tabBarItem = UITabBarItem(title: "Diary", image: UIImage(systemName: "note.text.badge.plus"), tag: 0)
		let diaryNavigationController =  UINavigationController(rootViewController: diaryVC)
		diaryNavigationController.setNavigationBarHidden(true, animated: false)
		return diaryNavigationController
		
	}

	func createIdeasNC() -> UINavigationController {
		
		let ideasVC = NotesVC()
		ideasVC.title = nil
		ideasVC.tabBarItem = UITabBarItem(title: "Ideas", image: UIImage(systemName: "note"), tag: 1)
		let ideaNavigationController = UINavigationController(rootViewController: ideasVC)
		ideaNavigationController.setNavigationBarHidden(true, animated: false)
		return ideaNavigationController
	}

	func createCalendarNC() -> UINavigationController {
		let calendarVC = CalendarVC()
		calendarVC.title = nil
		calendarVC.tabBarItem = UITabBarItem(title: "Calendar", image: UIImage(systemName: "calendar.circle.fill"), tag: 2)
		let calendarNavigationController = UINavigationController(rootViewController: calendarVC)
		calendarNavigationController.setNavigationBarHidden(true, animated: false)
		return calendarNavigationController
	}
	
	func createProfileNC() -> UINavigationController {
		let userInfoVC = UserInfoVC()
		userInfoVC.title = nil
		userInfoVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), tag: 3)
		let profileNavigationController = UINavigationController(rootViewController: userInfoVC)
		profileNavigationController.setNavigationBarHidden(true, animated: false)
		return profileNavigationController
	}

}
