//
//  NewTaskOverlayPresenter.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class NewTaskOverlayPresenter: OverlayPresenter {
}

extension NewTaskOverlayPresenter: NewTaskOverlayPresentationLogic {
	
	override func updateDateInDateCell() {
		updateDateAndTimeCellViewModels(withCellOfType: DailyRequiredDateCell.self, withNewDateAndTime: dataSource.assignedDay)
	}
	
	func updateRepeatCellViewModel(at indexPath: IndexPath) {
		guard
			let viewController = viewController,
			let repeatCellViewModel = viewController.cellsToDisplay[indexPath.section].cellViewModels[indexPath.row] as? DailyRepeatCellViewModel,
			let repeatSchedule = (dataSource as? NewTaskOverlayDataSource)?.repeatSchedule
		else { return }
		
		repeatCellViewModel.repeatSchedule = repeatSchedule
		viewController.updateViewModelForCell(at: indexPath)
	}
}
