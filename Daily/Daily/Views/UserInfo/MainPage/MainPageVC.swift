//
//  MainPageVC.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

class MainPageVC: MainTableVC {
	var interactor: MainPageBusinessLogic?
	var router: (MainPageRoutingLogic & MainPageDataPassing)?
  
	override func viewDidLoad() {
    super.viewDidLoad()
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(DailyProfileNavigationCell.self,
						   forCellReuseIdentifier: DailyProfileNavigationCell.cellIdentifier)
		tableView.register(DailyProfileLogoutCell.self,
						   forCellReuseIdentifier: DailyProfileLogoutCell.cellIdentifier)
		interactor?.fetchCells()
	}
  
}
extension MainPageVC: MainPageDisplayLogic {	
	func displayCells() {
		tableView.reloadData()
	}
}
