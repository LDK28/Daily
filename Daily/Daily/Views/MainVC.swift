//
//  MainVC.swift
//  Daily
//
//  Created by Арсений Токарев on 25.10.2020.
//

import UIKit

protocol MainDisplayLogic: AnyObject {
	var cellsToDisplay: [MainCellViewModel] { get set }
}

class MainTableVC: UITableViewController, MainDisplayLogic {
	var cellsToDisplay: [MainCellViewModel] = []
	
	@objc func dismissKeyboard() {
		tableView.endEditing(true)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupHideKeyboardOnTap()
		navigationController?.setNavigationBarHidden(false, animated: false)
		navigationController?.navigationBar.isTranslucent = false
		navigationController?.navigationBar.barTintColor = .dailyMainBackgroundColor
		navigationController?.navigationBar.tintColor = .dailyTextColor
		navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
		tableView.backgroundColor = .dailyMainBackgroundColor
		tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1))
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
	
	override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let header = UIView(frame: CGRect(x: 0, y: 0, width: 1, height: 25))
		header.backgroundColor = .clear
		return header
	}
}

extension UIViewController {
	func setupHideKeyboardOnTap() {
		self.view.addGestureRecognizer(self.endEditingRecognizer())
		self.navigationController?.navigationBar.addGestureRecognizer(self.endEditingRecognizer())
	}

	private func endEditingRecognizer() -> UIGestureRecognizer {
		let tap = UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:)))
		tap.cancelsTouchesInView = false
		return tap
	}
}
   

class MainVC: UIViewController {
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .dailyMainBackgroundColor
    }
}

