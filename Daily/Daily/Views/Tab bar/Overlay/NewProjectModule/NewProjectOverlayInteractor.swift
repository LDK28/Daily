//
//  NewProjectOverlayInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 08.11.2020.
//

import UIKit

protocol NewProjectOverlayBusinessLogic: OverlayBusinessLogic {
	func didToggleDateSwitcher()
}

class NewProjectOverlayInteractor: OverlayInteractor {
}



extension NewProjectOverlayInteractor: NewProjectOverlayBusinessLogic {
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
