//
//  MainVC.swift
//  Daily
//
//  Created by Арсений Токарев on 25.10.2020.
//

import UIKit

class MainTableVC: UITableViewController {
	var cellsToDisplay: [MainCellViewModel] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationController?.setNavigationBarHidden(false, animated: false)
		navigationController?.navigationBar.isTranslucent = false
		navigationController?.navigationBar.barTintColor = .dailyMainBackgroundColor
		navigationController?.navigationBar.tintColor = .dailyTextColor
		navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
		tableView.backgroundColor = .dailyMainBackgroundColor
		tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1))
		tableView.separatorColor = UIColor.dailyTabBarSelectedItemColor.withAlphaComponent(0.5)
		tableView.alwaysBounceVertical = false
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		tableView.estimatedRowHeight = 100
		tableView.rowHeight = UITableView.automaticDimension
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return cellsToDisplay.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cellViewModel = cellsToDisplay[indexPath.row]
		if let cell = tableView.dequeueReusableCell(withIdentifier: "\(cellViewModel.cellType)") as? MainCellProtocol {
			cell.setViewModel(cellViewModel)
			return cell
		}
		return UITableViewCell()
	}
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}

class MainVC: UIViewController {
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .dailyMainBackgroundColor
    }
}

