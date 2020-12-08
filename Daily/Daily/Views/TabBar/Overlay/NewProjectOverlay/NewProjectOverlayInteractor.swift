//
//  NewProjectOverlayInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class NewProjectOverlayInteractor: OverlayInteractor {
	
}

extension NewProjectOverlayInteractor: NewProjectOverlayBusinessLogic {
	override func fetchCells() {
		presenter?.present([
			TeamProjectSectionViewModel(),
			AssignableDateAndTimeSectionViewModel()
		])
	}
	
	func didToggleTeamProjectSwitcher() {
		(dataSource as? NewProjectOverlayDataSource)?.isTeamProject.toggle()
	}
	
	func didToggleDateSwitcher() {
		dataSource.userIsChoosingDate.toggle()
		dataSource.assignedDay = dataSource.userIsChoosingDate ? Date() : nil
		presenter?.updateDatePickerCellViewModel(precisedDateCellType: DailyOptionalDateCell.self)
	}
}