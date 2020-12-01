//
//  OverlayProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//

import UIKit

protocol OverlayDisplayLogic: AnyObject {
	var cellsToDisplay: [DailySectionViewModel] { get set }
	
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
	func present(_ cellsToDisplay: [DailySectionViewModel])
	func updateTimePickerViewModel()
	func updateTimeInTimeCell(newTime: Date?)
	func updateDateInDateCell()
}
