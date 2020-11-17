//
//  NewProjectOverlayInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 08.11.2020.
//

import UIKit

class NewProjectOverlayInteractor: OverlayInteractor {
	
}

extension NewProjectOverlayInteractor: NewProjectOverlayBusinessLogic {
	func didToggleTeamProjectSwitcher() {
		(dataSource as? NewProjectOverlayDataSource)?.isTeamProject.toggle()
	}
	
	func didChangeValueInDatePickerCell(newDay: Date) {
		if let sectionToUpdate = dataSource.sectionViewModels.firstIndex(where: { section in
			section.type == .dateAndTime
		}) {
			dataSource.assignedDay = newDay
			(presenter as? NewProjectOverlayPresenter)?.updateDateInDateCell(atSection: sectionToUpdate)
		}
	}
	
	func didToggleDateSwitcher() {
		guard let dataSource = dataSource as? NewProjectOverlayDataSource else { return }
		
		if let sectionToUpdate = dataSource.sectionViewModels.firstIndex(where: { section in
			section.type == .dateAndTime
		}) {
			dataSource.isAssignedToDate.toggle()
			presenter?.updateDateAndTimeSection(atIndex: sectionToUpdate, afterCellOfType: .optionalDate)
		}
	}	
}
