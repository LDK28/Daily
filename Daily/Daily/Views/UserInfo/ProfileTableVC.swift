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
	private let statusBar = UIView()
	
	override func viewDidLoad() {
	super.viewDidLoad()
		self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
		self.navigationController?.navigationBar.isTranslucent = true
		self.navigationController?.navigationBar.backgroundColor = .dailyProfileTileColor
		
		tableView.delegate = self
		tableView.dataSource = self
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		if let keyWindow = UIApplication.shared.connectedScenes
				.filter({$0.activationState == .foregroundActive})
				.map({$0 as? UIWindowScene})
				.compactMap({$0})
				.first?.windows
			.filter({$0.isKeyWindow}).first {
			
			statusBar.frame = keyWindow.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero
			statusBar.backgroundColor = .dailyProfileTileColor
			keyWindow.addSubview(statusBar)
		}
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		statusBar.removeFromSuperview()
	}
	
	override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let header = UIView(frame: CGRect(x: 0, y: 0, width: 1, height: 25))
		header.backgroundColor = .clear
		return header
	}
  
}
