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
	
	func didTapRepeatCell() {
		if let sectionToUpdate = getFirstIndexOfSection(ofType: .repeatSelector) {
			(dataSource as? NewTaskOverlayDataSource)?.repeatSchedule.nextCase()
			(presenter as? NewTaskOverlayPresenter)?.updateRepeatCell(atSection: sectionToUpdate)
		}
	}
}
