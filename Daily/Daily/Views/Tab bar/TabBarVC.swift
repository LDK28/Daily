//
//  TabBarVCViewController.swift
//  Daily
//
//  Created by Арсений Токарев on 23.10.2020.
//

import UIKit

class TabBarVC: UITabBarController {
	let plusButton = PlusButton(frame: .zero)
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.createTabBar()
		setupMiddleButton()
    }
	
	
	func setupMiddleButton() {
		//set sizes of the button accordingly to bound of a user's device
		//"x1.2" is just a multiplayer that makes this button a little bit bigger
		let multiplier: CGFloat = 1.2
		let size = tabBar.frame.size.height * multiplier
		plusButton.frame = CGRect(x: 0, y: 0, width: size, height: size)
		
		//framing the button (for further resizing)
		var plusButtonFrame = plusButton.frame
		
		plusButtonFrame.origin.y = self.view.bounds.height - plusButtonFrame.height - self.view.safeAreaInsets.bottom
		plusButtonFrame.origin.x = self.view.bounds.width / 2 - plusButtonFrame.size.width / 2
		
		plusButton.frame = plusButtonFrame
		
		self.view.addSubview(plusButton)
		self.view.layoutIfNeeded()
	}

	override func viewDidLayoutSubviews() {
	   super.viewDidLayoutSubviews()
		let multiplier: CGFloat = 1.45
		plusButton.frame.origin.y = self.view.bounds.height - plusButton.frame.height * multiplier - self.view.safeAreaInsets.bottom
   }
	
	func createTabBar() {

		let styling = self.tabBar
		styling.isTranslucent = false
		styling.tintColor = .dailyTabBarSelectedItemColor
		styling.unselectedItemTintColor = .dailyTabBarItemColor
		styling.barTintColor = .dailyTabBarColor

	
		self.viewControllers = [createDiaryNavigationController(), createIdeasNavigationController(), createCalendarNavigationController(), createProfileNavigationController()]
	}
	
	func createDiaryNavigationController() -> UINavigationController {
	
		let diaryVC = DiaryVC()
		diaryVC.title = nil
		
		diaryVC.tabBarItem = UITabBarItem(title: "Diary", image: UIImage(systemName: "note.text.badge.plus"), tag: 0)
		let diaryNavigationController =  UINavigationController(rootViewController: diaryVC)
		diaryNavigationController.setNavigationBarHidden(true, animated: false)
		
		return diaryNavigationController
		
	}

	func createIdeasNavigationController() -> UINavigationController {
		let ideasVC = IdeasVC()
		ideasVC.title = nil
		
		ideasVC.tabBarItem = UITabBarItem(title: "Ideas", image: UIImage(systemName: "note"), tag: 1)
		let ideaNavigationController = UINavigationController(rootViewController: ideasVC)
		
		ideaNavigationController.setNavigationBarHidden(true, animated: false)
		
		return ideaNavigationController
	}

	func createCalendarNavigationController() -> UINavigationController {
		let calendarVC = CalendarVC()
		calendarVC.title = nil
		
		calendarVC.tabBarItem = UITabBarItem(title: "Calendar", image: UIImage(systemName: "calendar.circle.fill"), tag: 2)
		let calendarNavigationController = UINavigationController(rootViewController: calendarVC)
		calendarNavigationController.setNavigationBarHidden(true, animated: false)
		return calendarNavigationController
	}
	
	func createProfileNavigationController() -> UINavigationController {
		let userInfoVC = UserInfoVC()
		userInfoVC.title = nil
		userInfoVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), tag: 3)
		
		let profileNavigationController = UINavigationController(rootViewController: userInfoVC)
		profileNavigationController.setNavigationBarHidden(true, animated: false)
		
		return profileNavigationController
	}
	

}
