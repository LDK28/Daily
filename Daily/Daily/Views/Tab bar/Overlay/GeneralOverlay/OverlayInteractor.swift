//
//  OverlayInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class OverlayInteractor: OverlayDataStore {
	var presenter: OverlayPresentationLogic?
	var dataSource = OverlayDataSource(sectionViewModels: [])
	
	func getFirstIndexOfSection(ofType type: DailySectionType) -> Int? {
		dataSource.sectionViewModels.firstIndex(where: { section in
			section.type == .dateAndTime
		})
	}
}

extension OverlayInteractor: OverlayBusinessLogic {
	func fetchCells() {
		presenter?.present(data: dataSource)
	}
	
	func didChangeTitle(text: String?) {
		dataSource.title = text
	}
	
	func didChangeValueInTimePickerCell(newTime: Date) {
		if let sectionToUpdate = getFirstIndexOfSection(ofType: .dateAndTime) {
			dataSource.assignedTime = newTime
			presenter?.updateTimeInTimeCell(atSection: sectionToUpdate)
		}
	}
	
	func didToggleTimeSwitcher() {
		if let sectionToUpdate = getFirstIndexOfSection(ofType: .dateAndTime) {
			dataSource.isAssignedToTime.toggle()
			presenter?.updateDateAndTimeSection(atIndex: sectionToUpdate, afterCellOfType: .time)
		}
	}
}
