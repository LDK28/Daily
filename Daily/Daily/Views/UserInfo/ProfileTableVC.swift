//
//  MainPageVC.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit
extension UITableView {
	func setAndLayoutTableHeaderView(header: UIView) {
		self.tableHeaderView = header
		header.setNeedsLayout()
		header.layoutIfNeeded()
		header.frame.size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
		self.tableHeaderView = header
	}
}

class ProfileTableVC: MainTableVC {
	override func loadView() {
		super.loadView()
		//tableView.setAndLayoutTableHeaderView(header: userCard)
	}
	
	override func viewDidLoad() {
	super.viewDidLoad()
		self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
		self.navigationController?.navigationBar.isTranslucent = true
		self.navigationController?.navigationBar.backgroundColor = .dailyProfileTileColor
		if #available(iOS 13.0, *) {
			let statusBar = UIView(frame: UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero)
			statusBar.backgroundColor = .dailyProfileTileColor
			 UIApplication.shared.keyWindow?.addSubview(statusBar)
		}
		
		tableView.delegate = self
		tableView.dataSource = self
		tableView.alwaysBounceVertical = false
	}
	
	override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let header = UIView(frame: CGRect(x: 0, y: 0, width: 1, height: 25))
		header.backgroundColor = .clear
		return header
	}
  
}
