//
//  NewProjectOverlayPresener.swift
//  Daily
//
//  Created by Арсений Токарев on 08.11.2020.
//

import UIKit


protocol NewProjectOverlayPresentationLogic: OverlayPresentationLogic {
	func updateDatePickerCell(atSection section: Int,isAssignedToDate: Bool)
}

class NewProjectOverlayPresenter: OverlayPresenter {
}


// MARK: - Presenter Protocol
extension NewProjectOverlayPresenter: NewProjectOverlayPresentationLogic {
	func updateDatePickerCell(atSection section: Int, isAssignedToDate: Bool) {
		guard let view = view else { return }
		guard let previousRow = dataSource.sectionViewModels[section].cellViewModels.firstIndex(where: { cellViewModel in
			cellViewModel.cellType == .optionalDate
		}) else { return }
		let rowToUpdate = previousRow + 1
		if isAssignedToDate {
			dataSource.sectionViewModels[section].cellViewModels.insert(
				DailyCellViewModel(title: nil,
								   icon: nil,
								   cellType: .datePicker,
								   isToggable: false,
								   isSelectable: false),
				at: rowToUpdate)
			if let datePickerCell = tableView?.dequeueReusableCell(withIdentifier: DailyDatePickerCell.cellIdentifier) as? DailyDatePickerCell {
				view.cellsToDisplay[section].insert(datePickerCell, at: rowToUpdate)
			}
			view.cellsToDisplay[section][rowToUpdate].sharpCorners()
			view.insert(at: IndexPath(row: rowToUpdate, section: section))
		} else {
			dataSource.sectionViewModels[section].cellViewModels.remove(at: rowToUpdate)
			view.cellsToDisplay[section].remove(at: rowToUpdate)
			view.delete(at: IndexPath(row: rowToUpdate, section: section))
		}
	}
	
}
