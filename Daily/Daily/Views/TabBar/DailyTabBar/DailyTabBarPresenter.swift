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
}

extension DailyTabBarPresenter {
	private func createDiaryNC() -> UINavigationController {

		let diaryVC = DiaryVC()
		diaryVC.title = nil
		diaryVC.tabBarItem = UITabBarItem(title: "Diary",
										  image: UIImage(systemName: "note.text.badge.plus"),
										  tag: 0)
		let diaryNavigationController =  UINavigationController(rootViewController: diaryVC)
		diaryNavigationController.setNavigationBarHidden(true, animated: false)
		return diaryNavigationController

	}
}
