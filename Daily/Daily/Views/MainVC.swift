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
        tableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
    }
}

class MainVC: UIViewController {

	private var hasChangedGradient = false
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = UIColor("E5E5E5")
		view.layer.insertSublayer(CALayer(), at: 0)
    }
	
	override func viewDidLayoutSubviews() {
		if !hasChangedGradient {
			switch traitCollection.userInterfaceStyle {
			case .light:
				view.lightLG()
			case .dark:
				view.darkLG()
			default:
				view.lightLG()
			}
			hasChangedGradient = true
		}
	}
	
	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		   super.traitCollectionDidChange(previousTraitCollection)

		   if #available(iOS 13.0, *) {
			   guard traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) else {
				   return
			}
			hasChangedGradient = false
			view.layer.sublayers?.removeAll()
			switch traitCollection.userInterfaceStyle {
			case .light:
				view.lightLG()
			case .dark:
				view.darkLG()
			default:
				view.lightLG()
			}
		   }
	   }


}
