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
}

extension OverlayInteractor: OverlayBusinessLogic {
	
	func didChangeTitle(text: String) {
		dataSource.title = text
		print(text)
	}
	
	func didChangeValueInTimePickerCell(newTime: Date) {
		if let sectionToUpdate = dataSource.sectionViewModels.firstIndex(where: { section in
			section.type == .dateAndTime
		}) {
			dataSource.assignedTime = newTime
			presenter?.updateTimeInTimeCell(atSection: sectionToUpdate)
		}
	}
	
	
	func didToggleTimeSwitcher() {
		if let sectionToUpdate = dataSource.sectionViewModels.firstIndex(where: { section in
			section.type == .dateAndTime
		}) {
			dataSource.isAssignedToTime.toggle()
			presenter?.updateDateAndTimeSection(atIndex: sectionToUpdate, afterCellOfType: .time)
		}
	}
	
	func fetchCells() {
		presenter?.present(data: dataSource)
	}
}
