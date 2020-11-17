//
//  Overlay Protocols.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//

import UIKit

protocol OverlayDisplayLogic: class {
	var cellsToDisplay: [[DailyCell]] { get set }
	
	func displayCells()
	func insert(at indexPath: IndexPath)
	func delete(at indexPath: IndexPath)
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
