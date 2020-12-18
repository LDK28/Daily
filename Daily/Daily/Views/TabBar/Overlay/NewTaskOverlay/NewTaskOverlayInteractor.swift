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
    
    func didTapSaveButton() {
        guard let dataSource = dataSource as? NewTaskOverlayDataSource else { return }
        UserRequest.shared.append(DiaryBackendModel( time: dataSource.assignedTime ?? Date(),
                                                     title: dataSource.title ?? "",
                                                     description: "",
                                                     isMade: false,
                                                     shouldRemind: dataSource.shouldRemind,
                                                     isAssignedToTime: dataSource.isAssignedToTime,
                                                     userIsChoosingDate: dataSource.userIsChoosingDate,
                                                     assignedTime: dataSource.assignedTime ?? Date(),
                                                     assignedDay: dataSource.assignedDay ?? Date(),
                                                     repeatSchedule: dataSource.repeatSchedule)) { result in
            switch result {
            case .success(()):
                (self.presenter as? NewTaskOverlayPresentationLogic)?.prepareViewForRoutingToDiary()
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
