//
//  NewProjectOverlayInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 08.11.2020.
//

import UIKit

protocol NewProjectOverlayBusinessLogic: OverlayBusinessLogic {
}

class NewProjectOverlayInteractor {
	let presenter: NewProjectOverlayPresentationLogic?
	let dataSource: OverlayDataSource
	
	init(dataSource: OverlayDataSource, presenter: NewProjectOverlayPresentationLogic) {
		self.dataSource = dataSource
		self.presenter = presenter
	}
}



extension NewProjectOverlayInteractor: NewProjectOverlayBusinessLogic {
	func didToggleTimeSwitcher() {
		dataSource.isAssignedToTime.toggle()
		if dataSource.isAssignedToTime {
			dataSource.sectionViewModels[1].cellViewModels.append(
				DailyCellViewModel(title: nil,
								   icon: nil,
								   cellType: .timePicker,
								   isToggable: false,
								   isSelectable: false)
			)
		} else {
			dataSource.sectionViewModels[1].cellViewModels.removeLast()
		}
		
		presenter?.present(data: dataSource)
	}
	
	func fetchCells() {
		presenter?.present(data: dataSource)
	}
}
