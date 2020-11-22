//
//  DailyTabBarPresenter.swift
//  Daily
//
//  Created by Арсений Токарев on 22.11.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class DailyTabBarPresenter {
	weak var viewController: DailyTabBarDisplayLogic?
	
	init(viewController: DailyTabBarDisplayLogic?) {
		self.viewController = viewController
	}
}

extension DailyTabBarPresenter: DailyTabBarPresentationLogic {
	
	func prepareViewForRoutingToLoginScreen() {
		viewController?.askRouterToNavigateToLoginScreen()
	}
	
	func present(using userData: CurrentUser?) {
		(viewController as? DailyTabBarVC)?.viewControllers = [createDiaryNC(), createIdeasNC(with: userData?.notes ?? []), createCalendarNC(), createProfileNC()]
	}
}




extension DailyTabBarPresenter {
	private func createDiaryNC() -> UINavigationController {

		let diaryVC = DiaryVC()
		diaryVC.title = nil
		diaryVC.tabBarItem = UITabBarItem(title: "Diary", image: UIImage(systemName: "note.text.badge.plus"), tag: 0)
		let diaryNavigationController =  UINavigationController(rootViewController: diaryVC)
		diaryNavigationController.setNavigationBarHidden(true, animated: false)
		return diaryNavigationController

	}

	private func createIdeasNC(with notes: [NotesCellViewModel]) -> UINavigationController {

		let ideasVC = NotesModule.build(with: notes)
		ideasVC.title = nil
		ideasVC.tabBarItem = UITabBarItem(title: "Ideas", image: UIImage(systemName: "note"), tag: 1)
		let ideaNavigationController = UINavigationController(rootViewController: ideasVC)
		ideaNavigationController.setNavigationBarHidden(true, animated: false)
		return ideaNavigationController
	}

	private func createCalendarNC() -> UINavigationController {
		let calendarVC = CalendarVC()
		calendarVC.title = nil
		calendarVC.tabBarItem = UITabBarItem(title: "Calendar", image: UIImage(systemName: "calendar.circle.fill"), tag: 2)
		let calendarNavigationController = UINavigationController(rootViewController: calendarVC)
		calendarNavigationController.setNavigationBarHidden(true, animated: false)
		return calendarNavigationController
	}

	private func createProfileNC() -> UINavigationController {
		let userInfoVC = UserInfoVC()
		userInfoVC.title = nil
		userInfoVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), tag: 3)
		let profileNavigationController = UINavigationController(rootViewController: userInfoVC)
		profileNavigationController.setNavigationBarHidden(true, animated: false)
		return profileNavigationController
	}
}
