//
//  Overlay Protocols.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//

import UIKit

protocol OverlayDisplayLogic: class {
	var cellsToDisplay: [[UITableViewCell]] { get set }
	
	func displayCells()
	func insert(at indexPath: IndexPath)
	func delete(at indexPath: IndexPath)
}

extension OverlayDisplayLogic {
	var cellsToDisplay: [[UITableViewCell]] {
		return [[]]
	}
}

protocol OverlayBusinessLogic {
	func fetchCells()
	func didToggleTimeSwitcher()
	
}

protocol OverlayPresentationLogic {
	func present(data: OverlayDataSource)
	func updateTimePickerCell(atSection section: Int)
}

protocol OverlayRoutingLogci {
	
}
