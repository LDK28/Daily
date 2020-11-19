//
//  OverlayProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//

import UIKit

protocol OverlayDisplayLogic: AnyObject {
	var cellsToDisplay: [[DailyCell]] { get set }
	
	func displayCells()
	func insert(at indexPath: IndexPath)
	func delete(at indexPath: IndexPath)
	func update(at indexPath: IndexPath)
}

protocol OverlayBusinessLogic {
	func fetchCells()
	func didToggleTimeSwitcher()
	func didChangeValueInTimePickerCell(newTime: Date)
	func didChangeTitle(text: String?)
	func didTapCellAt(indexPath: IndexPath)
	func didChangeValueInDatePickerCell(newDay: Date)
	
}

protocol OverlayDataStore: AnyObject {
	var dataSource: OverlayDataSource { get set }
}

protocol OverlayPresentationLogic {
	func present(data: OverlayDataSource)
	func updateDateAndTimeSection(atIndex section: Int, afterCellOfType cellType: DailyCellType)
	func updateTimeInTimeCell(atSection section: Int)
	func updateDateInDateCell(atSection section: Int)
}
