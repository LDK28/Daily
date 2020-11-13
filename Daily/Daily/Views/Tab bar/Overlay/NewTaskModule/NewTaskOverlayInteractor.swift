//
//  NewTaskOverlayInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 05.11.2020.
//

import UIKit

protocol NewTaskOverlayBusinessLogic: OverlayBusinessLogic {
}

class NewTaskOverlayInteractor {
	let presenter: NewTaskOverlayPresentationLogic?
	let dataSource: NewTaskOverlayDataSource
	
	init(dataSource: NewTaskOverlayDataSource, presenter: NewTaskOverlayPresentationLogic) {
		self.dataSource = dataSource
		self.presenter = presenter
	}
}

// MARK: - Interactor Protocol

extension NewTaskOverlayInteractor: NewTaskOverlayBusinessLogic {
	func didToggleTimeSwitcher() {
		dataSource.isAssignedToTime.toggle()
		if dataSource.isAssignedToTime {
			dataSource.sectionViewModels[0].cellViewModels.append(
				DailyCellViewModel(title: nil,
								   icon: nil,
								   cellType: .timePicker,
								   isToggable: false,
								   isSelectable: false)
			)
		} else {
			dataSource.sectionViewModels[0].cellViewModels.removeLast()
		}
		
		presenter?.present(data: dataSource)
	}
	
	func fetchCells() {
		presenter?.present(data: dataSource)
	}
}
