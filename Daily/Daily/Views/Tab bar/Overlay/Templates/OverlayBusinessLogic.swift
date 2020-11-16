//
//  OverlayBusinessLogic.swift
//  Daily
//
//  Created by Арсений Токарев on 12.11.2020.
//

import UIKit

protocol OverlayBusinessLogic {
	func fetchCells()
	func didToggleTimeSwitcher()
}


class OverlayInteractor {
	let presenter: OverlayPresentationLogic?
	let dataSource: OverlayDataSource
	
	init(dataSource: OverlayDataSource, presenter: OverlayPresentationLogic?) {
		self.dataSource = dataSource
		self.presenter = presenter
	}
}
extension OverlayInteractor: OverlayBusinessLogic {
	func didToggleTimeSwitcher() {
		dataSource.isAssignedToTime.toggle()
		if dataSource is NewTaskOverlayDataSource {
			presenter?.updateTimePickerCell(atSection: 0)
		} else {
			presenter?.updateTimePickerCell(atSection: 1)
		}
	}
	
	func fetchCells() {
		presenter?.present(data: dataSource)
	}
}
