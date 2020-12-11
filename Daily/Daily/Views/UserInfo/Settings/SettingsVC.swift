//
//  ProfileSettingsVC.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

class SettingsVC: ProfileTableVC {
	var interactor: SettingsBusinessLogic?
	var router: (SettingsRoutingLogic & SettingsDataPassing)?
	
	override func loadView() {
		headerView = MenuItemCard()
		super.loadView()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.backButtonTitle = NSLocalizedString("Settings", comment: "")

		tableView.register(DailySettingsNotificationsCell.self,
						   forCellReuseIdentifier: DailySettingsNotificationsCell.cellIdentifier)
		tableView.register(DailySettingsLanguageCell.self,
						   forCellReuseIdentifier: DailySettingsLanguageCell.cellIdentifier)
		interactor?.fetchCells()
		
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		switch cellsToDisplay[indexPath.row].cellType {
		case is DailySettingsNotificationsCell.Type:
			router?.navigateTo(viewController: NotificationsModule.build())
		case is DailySettingsLanguageCell.Type:
			router?.navigateTo(viewController: ChooseLanguageModule.build())
		default:
			return
		}
		
	}
  
}
extension SettingsVC: SettingsDisplayLogic {
}
