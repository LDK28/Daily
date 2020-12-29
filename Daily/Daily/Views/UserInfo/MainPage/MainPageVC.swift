//
//  MainPageVC.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

class MainPageVC: ProfileTableVC {
	var interactor: MainPageBusinessLogic?
	var router: (MainPageRoutingLogic & MainPageDataPassing)?
	
	override func loadView() {
		headerView = UserCard()
		super.loadView()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.backButtonTitle = NSLocalizedString("Profile", comment: "")

		tableView.register(DailySettingsNotificationsCell.self,
						   forCellReuseIdentifier: DailySettingsNotificationsCell.cellIdentifier)
		tableView.register(DailyProfileAchievementsCell.self,
						   forCellReuseIdentifier: DailyProfileAchievementsCell.cellIdentifier)
		tableView.register(DailyProfileHelpCell.self,
						   forCellReuseIdentifier: DailyProfileHelpCell.cellIdentifier)
		tableView.register(DailyProfileLogoutCell.self,
						   forCellReuseIdentifier: DailyProfileLogoutCell.cellIdentifier)
		interactor?.fetchCells()
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		switch cellsToDisplay[indexPath.row].cellType {
		case is DailySettingsNotificationsCell.Type:
			router?.navigateTo(viewController: NotificationsModule.build())
		case is DailyProfileAchievementsCell.Type:
			router?.navigateTo(viewController: ProfileAchievementsModule.build())
		case is DailyProfileHelpCell.Type:
			router?.navigateTo(viewController: ProfileHelpModule.build())
		case is DailyProfileLogoutCell.Type:
			router?.logOut()
		default:
			return
		}
		
	}
}
extension MainPageVC: MainPageDisplayLogic {	
 
}
