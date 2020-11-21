//
//  MainVC.swift
//  Daily
//
//  Created by Арсений Токарев on 25.10.2020.
//

import UIKit

class MainTableVC: UITableViewController {	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationController?.setNavigationBarHidden(false, animated: false)
		navigationController?.navigationBar.isTranslucent = false
		navigationController?.navigationBar.barTintColor = .dailyMainBackgroundColor
		navigationController?.navigationBar.tintColor = .dailyTextColor
		navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
		
		tableView.backgroundColor = .dailyMainBackgroundColor
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		tableView.estimatedRowHeight = 100
		tableView.rowHeight = UITableView.automaticDimension
	}
}

class MainVC: UIViewController {
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .dailyMainBackgroundColor
    }

}
