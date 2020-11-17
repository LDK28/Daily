//
//  OverlayBusinessLogic.swift
//  Daily
//
//  Created by Арсений Токарев on 12.11.2020.
//

import UIKit

class OverlayInteractor {
	internal let presenter: OverlayPresentationLogic?
	internal let dataSource: OverlayDataSource
	
	init(dataSource: OverlayDataSource, presenter: OverlayPresentationLogic?) {
		self.dataSource = dataSource
		self.presenter = presenter
	}
}
extension OverlayInteractor: OverlayBusinessLogic {
	func didToggleTimeSwitcher() {
		if let sectionToUpdate = dataSource.sectionViewModels.firstIndex(where: { section in
			section.type == .dateAndTime
		}) {
			dataSource.isAssignedToTime.toggle()
			presenter?.updateTimePickerCell(atSection: sectionToUpdate)
		}
	}
	
	func fetchCells() {
		presenter?.present(data: dataSource)
	}
}
