//
//  NewProjectOverlayPresenter.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class NewProjectOverlayPresenter: OverlayPresenter {
}


// MARK: - Presenter Protocol
extension NewProjectOverlayPresenter: NewProjectOverlayPresentationLogic {
	func updateDateInDateCell(atSection section: Int) {
		guard let dateCellIndex = dataSource.sectionViewModels[section].cellViewModels.firstIndex(where: { cellViewModel in
			cellViewModel.cellType == .optionalDate
		}) else { return }
		guard let dateCell = viewController?.cellsToDisplay[section][dateCellIndex] as? DailyOptionalDateCell else { return }
		dateCell.date = dataSource.assignedDay
		viewController?.update(at: IndexPath(row: dateCellIndex, section: section))
	}
}
