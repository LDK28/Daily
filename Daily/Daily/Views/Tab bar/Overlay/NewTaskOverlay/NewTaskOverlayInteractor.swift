//
//  NewTaskOverlayInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class NewTaskOverlayInteractor: OverlayInteractor {
}

extension NewTaskOverlayInteractor: NewTaskOverlayBusinessLogic {
	func didTapDateCell(at indexPath: IndexPath) {
		dataSource.userIsChoosingDate.toggle()
		presenter?.updateDatePickerCellViewModel(precisedDateCellType: DailyRequiredDateCell.self)
	}
	
	func didToggleRemindSwitcher() {
		(dataSource as? NewTaskOverlayDataSource)?.shouldRemind.toggle()
	}
	
	override func fetchCells() {
		dataSource.assignedDay = Date()
		presenter?.present([
				DateAndAssignableTimeSectionViewModel(),
				RemindViewModel(),
				RepeatViewModel()
		])
	}
	
	func didTapRepeatCell(at indexPath: IndexPath) {
		(dataSource as? NewTaskOverlayDataSource)?.repeatSchedule.nextCase()
		(presenter as? NewTaskOverlayPresenter)?.updateRepeatCellViewModel(at: indexPath)
	}
}
