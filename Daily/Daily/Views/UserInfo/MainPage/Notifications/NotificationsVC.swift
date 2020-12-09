//
//  NotificationsVC.swift
//  Daily
//
//  Created by Арсений Токарев on 09.12.2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

class NotificationsVC: ProfileTableVC {
	var interactor: NotificationsBusinessLogic?
	var router: (NotificationsRoutingLogic & NotificationsDataPassing)?
	
	override func loadView() {
		headerView = MenuItemCard()
		super.loadView()
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.backButtonTitle = NSLocalizedString("Notifications", comment: "")

		tableView.register(DailyNotificationsSoundCell.self,
						   forCellReuseIdentifier: DailyNotificationsSoundCell.cellIdentifier)
		tableView.register(DailyNotificationsAlarmCell.self,
						   forCellReuseIdentifier: DailyNotificationsAlarmCell.cellIdentifier)
		tableView.register(DailyNotificationsReportCell.self,
						   forCellReuseIdentifier: DailyNotificationsReportCell.cellIdentifier)
		interactor?.fetchCells()
		
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		switch cellsToDisplay[indexPath.row].cellType {
		default:
			return
		}
	}
}
extension NotificationsVC: NotificationsDisplayLogic {

}
