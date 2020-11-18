//
//  NewTaskOverlayPresenter.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class NewTaskOverlayPresenter: OverlayPresenter {
}

extension NewTaskOverlayPresenter: NewTaskOverlayPresentationLogic {
	func updateRepeatCell(atSection section: Int) {
		if let repeatCellIndex = getFirstIndexOfRow(atSection: section, withType: .repeatSchedule) {
			(viewController?.cellsToDisplay[section][repeatCellIndex] as? DailyRepeatCell)?.repeatSchedule = (dataSource as? NewTaskOverlayDataSource)?.repeatSchedule ?? .never
			viewController?.update(at: IndexPath(row: repeatCellIndex, section: section))
		}
	}
}
