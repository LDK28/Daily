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

class NewProjectOverlayInteractor {
	let presenter: NewProjectOverlayPresentationLogic?
	let dataSource: NewProjectOverlayDataSource
	
	init(dataSource: NewProjectOverlayDataSource, presenter: NewProjectOverlayPresentationLogic) {
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
	
	func didToggleDateSwitcher() {
		dataSource.isAssignedToDate.toggle()
		if dataSource.isAssignedToDate {
			let cellViewModel = DailyCellViewModel(title: nil,
												   icon: nil,
									   cellType: .datePicker,
									   isToggable: false,
									   isSelectable: false)
			dataSource.sectionViewModels[1].cellViewModels.insert(cellViewModel, at: 1)
		} else {
			dataSource.sectionViewModels[1].cellViewModels.remove(at: 1)
		}
		presenter?.present(data: dataSource)
	}
	
	func fetchCells() {
		presenter?.present(data: dataSource)
	}
}
