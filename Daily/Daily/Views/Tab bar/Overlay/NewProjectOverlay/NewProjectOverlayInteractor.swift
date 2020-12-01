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
	func didToggleTeamProjectSwitcher() {
		(dataSource as? NewProjectOverlayDataSource)?.isTeamProject.toggle()
	}
	
	func didToggleDateSwitcher() {
		guard let dataSource = dataSource as? NewProjectOverlayDataSource else { return }
		
//		if let sectionToUpdate = dataSource.sectionViewModels.firstIndex(where: { section in
//			section.type == .dateAndTime
//		}) {
//			dataSource.isAssignedToDate.toggle()
//			//presenter?.updateDateAndTimeSection(atIndex: sectionToUpdate, afterCellOfType: DailyOptionalDateCell.self)
//		}
	}
}
