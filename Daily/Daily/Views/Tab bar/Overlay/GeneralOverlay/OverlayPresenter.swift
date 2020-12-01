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
	
	internal func getIndexPathWith(sectionType: DailySectionType,
								   cellType: UITableViewCell.Type) -> IndexPath? {
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
	
	internal func updateDateAndTimeForView(withCellOfType type: UITableViewCell.Type,
										   withNewDateAndTime dateAndTime: Date?) {
		guard
			let viewController = viewController,
			let cellIndexPath = getIndexPathWith(sectionType: .dateAndTime, cellType: type),
			let cellViewModel = viewController.cellsToDisplay[cellIndexPath.section].cellViewModels[cellIndexPath.row] as? DailyDateAndTimeCellViewModel
		else { return }
		cellViewModel.dateAndTime = dateAndTime
		viewController.updateViewModelForCell(at: cellIndexPath)
	}
	
	internal func changeDateAndTimeSection(_ cellViewModel: DailyDateAndTimeCellViewModel,
										   afterCellOfType cellType: UITableViewCell.Type,
										   dateComponent: Date?,
										   if conditionIsTrue: Bool) {
		guard
			let viewController = viewController,
			let previousIndexPath = getIndexPathWith(sectionType: .dateAndTime,
													 cellType: cellType)
		else { return }
		cellViewModel.dateAndTime = dateComponent
		let indexPathToUpdate = IndexPath(row: previousIndexPath.row + 1, section: previousIndexPath.section)
		if conditionIsTrue {
			viewController.cellsToDisplay[indexPathToUpdate.section].cellViewModels.insert(cellViewModel, at: indexPathToUpdate.row)
			viewController.insert(at: [indexPathToUpdate])
		} else {
			viewController.cellsToDisplay[indexPathToUpdate.section].cellViewModels.remove(at: indexPathToUpdate.row)
			viewController.delete(at: [indexPathToUpdate])
		}
		(viewController.cellsToDisplay[previousIndexPath.section].cellViewModels[previousIndexPath.row] as? DailyDateAndTimeCellViewModel)?.dateAndTime = dateComponent
		viewController.updateViewModelForCell(at: previousIndexPath)
	}
}

extension OverlayPresenter: OverlayPresentationLogic {
	
	@objc func updateDateInDateCell() {
		/* override if needed */
	}
	
	func updateTimeInTimeCell() {
		updateDateAndTimeForView(withCellOfType: DailyTimeCell.self,
								 withNewDateAndTime: dataSource.assignedTime)
	}
	
	func updateDatePickerCellViewModel(precisedDateCellType: UITableViewCell.Type) {
		changeDateAndTimeSection(DailyDateAndTimeCellViewModel(
									title: nil,
									icon: nil,
									cellType: DailyDatePickerCell.self,
									isToggable: false,
									isSelectable: false),
							afterCellOfType: precisedDateCellType,
							dateComponent: dataSource.assignedDay,
							if: dataSource.userIsChoosingDate)
	}
	
	func updateTimePickerViewModel() {
		changeDateAndTimeSection(DailyDateAndTimeCellViewModel(
									title: nil,
									icon: nil,
									cellType: DailyTimePickerCell.self,
									isToggable: false,
									isSelectable: false),
							afterCellOfType: DailyTimeCell.self,
							dateComponent: dataSource.assignedTime,
							if: dataSource.isAssignedToTime)
	}
}

extension OverlayPresenter {
	func present(_ cellsToDisplay: [DailySectionViewModel]) {
		guard let viewController = viewController else { return }
		viewController.cellsToDisplay = cellsToDisplay
		viewController.displayCells()
	}
}

