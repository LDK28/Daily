//
//  ChooseLanguageVC.swift
//  Daily
//
//  Created by Арсений Токарев on 09.12.2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

class ChooseLanguageVC: ProfileTableVC {
	var interactor: ChooseLanguageBusinessLogic?
	var router: (ChooseLanguageRoutingLogic & ChooseLanguageDataPassing)?
  
	override func loadView() {
		headerView = MenuItemCard()
		super.loadView()
	}
	
	override func viewDidLoad() {
    super.viewDidLoad()
		tableView.register(DailyLanguageCell.self,
						   forCellReuseIdentifier: DailyLanguageCell.cellIdentifier)
		interactor?.fetchCells()
		
	}
  
}
extension ChooseLanguageVC: ChooseLanguageDisplayLogic {
	func displaySomething() {
	  
	}
}
