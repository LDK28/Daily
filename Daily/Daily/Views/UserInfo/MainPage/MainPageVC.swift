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
  
	internal let userCard = UserCard()
	
	override func loadView() {
		super.loadView()
		tableView.setAndLayoutTableHeaderView(header: userCard)
	}
	
	override func viewDidLoad() {
    super.viewDidLoad()
		tableView.register(DailyProfileSettingCell.self,
						   forCellReuseIdentifier: DailyProfileSettingCell.cellIdentifier)
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
		
	}
}
extension MainPageVC: MainPageDisplayLogic {	
	func displayCells() {
		tableView.reloadData()
	}
}
