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
	
	func insert(at indexPaths: [IndexPath])
	
	func delete(at indexPaths: [IndexPath])
	
	func updateViewModelForCell(at indexPath: IndexPath)
}

protocol OverlayBusinessLogic {
	func fetchCells()
	
	func didToggleTimeSwitcher()
	
	func didChangeValueInTimePickerCell(newTime: Date)
	
	func didChangeTitle(text: String?)
	
	func didChangeValueInDatePickerCell(newDay: Date)
	
}

protocol OverlayDataStore: AnyObject {
	var dataSource: OverlayDataSource { get set }
}

protocol OverlayPresentationLogic {
	func present(_ cellsToDisplay: [DailySectionViewModel])
	
	func updateTimeInTimeCell()
	
	func updateTimePickerCellViewModel()
	
	func updateDateInDateCell()
	
	func updateDatePickerCellViewModel(precisedDateCellType: UITableViewCell.Type)
}
