//
//  OverlayInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class OverlayInteractor: OverlayDataStore {
	var presenter: OverlayPresentationLogic?
	var dataSource = OverlayDataSource()
}

extension OverlayInteractor: OverlayBusinessLogic {
	@objc func fetchCells() {
		
	}
	
	func didChangeValueInDatePickerCell(newDay: Date) {
		dataSource.assignedDay = newDay
//		if let sectionToUpdate = dataSource.sectionViewModels.firstIndex(where: { section in
//			section.type == .dateAndTime
//		}) {
//			dataSource.assignedDay = newDay
//			presenter?.updateDateInDateCell(atSection: sectionToUpdate)
//		}
	}
	
	@objc func didTapCellAt(indexPath: IndexPath) {
		
	}
	
	func didChangeTitle(text: String?) {
		dataSource.title = text
	}
	
	func didChangeValueInTimePickerCell(newTime: Date) {
		dataSource.assignedTime = newTime
		presenter?.updateTimeInTimeCell(newTime: newTime)
	}
	
	func didToggleTimeSwitcher() {
		dataSource.isAssignedToTime.toggle()
		presenter?.updateTimePickerViewModel()
	}
}
