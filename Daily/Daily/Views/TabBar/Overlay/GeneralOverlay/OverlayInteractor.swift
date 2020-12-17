//
//  OverlayInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class OverlayInteractor: OverlayDataStore {
	var presenter: OverlayPresentationLogic?
	var dataSource: OverlayDataSource
	
	init(presenter: OverlayPresentationLogic?, dataSource: OverlayDataSource) {
		self.presenter = presenter
		self.dataSource = dataSource
	}
}

extension OverlayInteractor: OverlayBusinessLogic {
	@objc func fetchCells() {
		/* override if needed */
	}
	
	func didChangeValueInDatePickerCell(newDay: Date) {
		dataSource.assignedDay = newDay
		presenter?.updateDateInDateCell()
	}
	
	func didChangeTitle(text: String?) {
		dataSource.title = text
        print(dataSource.title ?? "😹")
	}
	
	func didChangeValueInTimePickerCell(newTime: Date) {
		dataSource.assignedTime = newTime
		presenter?.updateTimeInTimeCell()
	}
	
	func didToggleTimeSwitcher() {
		dataSource.isAssignedToTime.toggle()
		dataSource.assignedTime = dataSource.isAssignedToTime ? Date() : nil
		presenter?.updateTimePickerCellViewModel()
	}
}
