//
//  OverlayPresenter.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class OverlayPresenter: OverlayDataStore {
	weak var viewController: OverlayDisplayLogic?
	var dataSource = OverlayDataSource()
	
	internal func getIndexPathWhere(sectionTypeIs sectionType: DailySectionType,
								    cellTypeIs cellType: UITableViewCell.Type) -> IndexPath? {
		guard
			let viewController = viewController,
			let section =
				viewController.cellsToDisplay.firstIndex(
					where: { sectionViewModel in
						sectionViewModel.type == sectionType
				}),
			let row =
				viewController.cellsToDisplay[section].cellViewModels.firstIndex(
					where: { cellViewModel in
						cellViewModel.cellType == cellType
				})
		else { return nil }
		
		return IndexPath(row: row, section: section)
	}
	
	internal func updateDateAndTimeCellViewModels(withCellOfType type: UITableViewCell.Type,
												  withNewDateAndTime dateAndTime: Date?) {
		guard
			let viewController = viewController,
			let cellIndexPath = getIndexPathWhere(sectionTypeIs: .dateAndTime,
												  cellTypeIs: type),
			let cellViewModel = viewController.cellsToDisplay.getViewModel(at: cellIndexPath) as? DailyDateAndTimeCellViewModel
		else { return }
		cellViewModel.dateAndTime = dateAndTime
		viewController.updateViewModelForCell(at: cellIndexPath)
	}
	
	internal func updateDateAndTimePickerCellViewModel(with cellViewModel: DailyDateAndTimeCellViewModel,
													   afterCellOfType cellType: UITableViewCell.Type,
													   dateComponent: Date?,
													   insertIf conditionIsTrue: Bool) {
		guard
			let viewController = viewController,
			let previousIndexPath = getIndexPathWhere(sectionTypeIs: .dateAndTime,
													 cellTypeIs: cellType),
			let dateOrTimeCellViewModel = viewController.cellsToDisplay.getViewModel(at: previousIndexPath) as? DailyDateAndTimeCellViewModel
		else { return }
		cellViewModel.dateAndTime = dateComponent
		let indexPathToUpdate = previousIndexPath.nextRow()
		if conditionIsTrue {
			viewController.cellsToDisplay.insert(cellViewModel, at: indexPathToUpdate)
			viewController.insert(at: [indexPathToUpdate])
		} else {
			viewController.cellsToDisplay.remove(at: indexPathToUpdate)
			viewController.delete(at: [indexPathToUpdate])
		}
		dateOrTimeCellViewModel.dateAndTime = dateComponent
		
		let indices = viewController.cellsToDisplay[previousIndexPath.section].cellViewModels.indices
		dateOrTimeCellViewModel.determineCornerMask(OfCellViewModelWithIndex: previousIndexPath.row,
													inSectionWithRowIndices: indices)
		viewController.updateViewModelForCell(at: previousIndexPath)
	}
	
	init(viewController: OverlayDisplayLogic?, dataSource: OverlayDataSource) {
		self.viewController = viewController
		self.dataSource = dataSource
	}
}

extension OverlayPresenter: OverlayPresentationLogic {
	
	@objc func updateDateInDateCell() {
		/* override if needed */
	}
	
	func updateTimeInTimeCell() {
		updateDateAndTimeCellViewModels(withCellOfType: DailyTimeCell.self,
								 withNewDateAndTime: dataSource.assignedTime)
	}
	
	func updateDatePickerCellViewModel(precisedDateCellType: UITableViewCell.Type) {
		updateDateAndTimePickerCellViewModel(
			with: DailyDateAndTimeCellViewModel(
				title: nil,
				icon: nil,
				cellType: DailyDatePickerCell.self,
				isToggable: false,
				cellPosition: .within),
			afterCellOfType: precisedDateCellType,
			dateComponent: dataSource.assignedDay,
			insertIf: dataSource.userIsChoosingDate)
	}
	
	func updateTimePickerCellViewModel() {
		updateDateAndTimePickerCellViewModel(with: DailyDateAndTimeCellViewModel(
			title: nil,
			icon: nil,
			cellType: DailyTimePickerCell.self,
			isToggable: false,
			cellPosition: .last),
		afterCellOfType: DailyTimeCell.self,
		dateComponent: dataSource.assignedTime,
		insertIf: dataSource.isAssignedToTime)
	}
}

extension OverlayPresenter {
	func present(_ cellsToDisplay: [DailySectionViewModel]) {
		guard let viewController = viewController else { return }
		viewController.cellsToDisplay = cellsToDisplay
		viewController.displayCells()
	}
}

