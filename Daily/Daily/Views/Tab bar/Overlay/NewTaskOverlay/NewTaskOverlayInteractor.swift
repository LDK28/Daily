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
	func didToggleRemindSwitcher() {
		(dataSource as? NewTaskOverlayDataSource)?.shouldRemind.toggle()
	}
	
	override func fetchCells() {
		presenter?.present([
				DateAndAssignableTimeSectionViewModel(),
				RemindViewModel(),
				RepeatViewModel()
		])
	}
	
	override func didTapCellAt(indexPath: IndexPath) {
//		switch dataSource.sectionViewModels[indexPath.section].type {
//		case .dateAndTime:
//			(dataSource as? NewTaskOverlayDataSource)?.userIsChoosingDate.toggle()
//			//presenter?.updateDateAndTimeSection(atIndex: indexPath.section, afterCellOfType: DailyRequiredDateCell.self)
//		case .repeatSelector:
//			(dataSource as? NewTaskOverlayDataSource)?.repeatSchedule.nextCase()
//			(presenter as? NewTaskOverlayPresenter)?.updateRepeatCell(at: indexPath)
//		default:
//			return
//		}
	}
}
