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
	
	private func getIndexPathWith(sectionType: DailySectionType,
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
}

extension OverlayPresenter: OverlayPresentationLogic {
	
	func updateDateInDateCell() {
		
	}
	
	func updateTimeInTimeCell(newTime: Date?) {
		guard
			let viewController = viewController,
			let timeCellIndexPath = getIndexPathWith(sectionType: .dateAndTime, cellType: DailyTimeCell.self),
			let timeCellViewModel = viewController.cellsToDisplay[timeCellIndexPath.section].cellViewModels[timeCellIndexPath.row] as? DailyDateAndTimeCellViewModel
		else { return }
		timeCellViewModel.dateAndTime = newTime
		viewController.update(at: timeCellIndexPath)
	}
	
	func updateTimePickerViewModel() {
		guard
			let viewController = viewController,
			let previousCellIndexPath = getIndexPathWith(sectionType: .dateAndTime, cellType: DailyTimeCell.self)
		else { return }
		let indexPathToUpdate = IndexPath(row: previousCellIndexPath.row + 1, section: previousCellIndexPath.section)
		if dataSource.isAssignedToTime {
			let timePickerCellViewModel =
				DailyCellViewModel(
					title: nil, icon: nil,
					cellType: DailyTimePickerCell.self,
					isToggable: false,
					isSelectable: false)
			viewController.cellsToDisplay[indexPathToUpdate.section].cellViewModels.insert(timePickerCellViewModel, at: indexPathToUpdate.row)
			viewController.insert(at: indexPathToUpdate)
		} else {
			viewController.cellsToDisplay[indexPathToUpdate.section].cellViewModels.remove(at: indexPathToUpdate.row)
			viewController.delete(at: indexPathToUpdate)
		}
	}
}

extension OverlayPresenter {
	func present(_ cellsToDisplay: [DailySectionViewModel]) {
		guard let viewController = viewController else { return }
		viewController.cellsToDisplay = cellsToDisplay
		viewController.displayCells()
	}
}

