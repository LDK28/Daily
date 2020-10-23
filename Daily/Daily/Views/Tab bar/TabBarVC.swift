//
//  TabBarVCViewController.swift
//  Daily
//
//  Created by Арсений Токарев on 23.10.2020.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

		self.createTabBar()
    }
    

	func createTabBar() {
		// here we assign a tint to all our tabbars, this will be visible on the items (icons)
		let styling = self.tabBar
		styling.isTranslucent = false
		styling.tintColor = .dailyTabBarSelectedItemColor
		styling.unselectedItemTintColor = .dailyTabBarItemColor
		styling.barTintColor = .dailyTabBarColor

		// replace our array variables with the functions we created
		self.viewControllers = [createDiaryNavigationController(), createIdeasNavigationController(), createCalendarNavigationController(), createProfileNavigationController()]
	}
	
	func createDiaryNavigationController() -> UINavigationController {
		// we create the view controller and insert into the nav controller and return
		let diaryVC = DiaryVC()
		diaryVC.title = nil
		// it is a system tabbaritem , tag zero because it is the first one
		diaryVC.tabBarItem = UITabBarItem(title: "Diary", image: UIImage(systemName: "note.text.badge.plus"), tag: 0)
		let diaryNavigationController =  UINavigationController(rootViewController: diaryVC)
		diaryNavigationController.setNavigationBarHidden(true, animated: false)
		
		return diaryNavigationController
		
	}

	func createIdeasNavigationController() -> UINavigationController {
		let ideasVC = IdeasVC()
		ideasVC.title = nil
		// it is a system tabbaritem , tag zero because it is the first one
		ideasVC.tabBarItem = UITabBarItem(title: "Ideas", image: UIImage(systemName: "note"), tag: 1)
		let ideaNavigationController = UINavigationController(rootViewController: ideasVC)
		
		ideaNavigationController.setNavigationBarHidden(true, animated: false)
		
		return ideaNavigationController
	}

	func createCalendarNavigationController() -> UINavigationController {
		let calendarVC = CalendarVC()
		calendarVC.title = nil
		// it is a system tabbaritem , tag zero because it is the first one
		calendarVC.tabBarItem = UITabBarItem(title: "Calendar", image: UIImage(systemName: "calendar.circle.fill"), tag: 2)
		let calendarNavigationController = UINavigationController(rootViewController: calendarVC)
		calendarNavigationController.setNavigationBarHidden(true, animated: false)
		return calendarNavigationController
	}
	
	func createProfileNavigationController() -> UINavigationController {
		let userInfoVC = UserInfoVC()
		userInfoVC.title = nil
		// it is a system tabbaritem , tag zero because it is the first one
		userInfoVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), tag: 3)
		let profileNavigationController = UINavigationController(rootViewController: userInfoVC)
		profileNavigationController.setNavigationBarHidden(true, animated: false)
		
		return profileNavigationController
	}
	

}
