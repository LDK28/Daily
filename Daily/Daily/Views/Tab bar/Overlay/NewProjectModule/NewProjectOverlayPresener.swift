//
//  NewProjectOverlayPresener.swift
//  Daily
//
//  Created by Арсений Токарев on 08.11.2020.
//

import UIKit

class NewProjectOverlayPresenter: OverlayPresenter {
}


// MARK: - Presenter Protocol
extension NewProjectOverlayPresenter: NewProjectOverlayPresentationLogic {
	func updateDateInDateCell(atSection section: Int) {
		guard let dateCellIndex = dataSource.sectionViewModels[section].cellViewModels.firstIndex(where: { cellViewModel in
			cellViewModel.cellType == .optionalDate
		}) else { return }
		guard let dateCell = view?.cellsToDisplay[section][dateCellIndex] as? DailyOptionalDateCell else { return }
		dateCell.date = dataSource.assignedDay
		view?.update(at: IndexPath(row: dateCellIndex, section: section))
	}
}
