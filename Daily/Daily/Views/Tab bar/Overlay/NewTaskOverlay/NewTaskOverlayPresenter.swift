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
	func updateRepeatCell(at indexPath: IndexPath) {
//		(viewController?.cellsToDisplay[indexPath.section][indexPath.row] as? DailyRepeatCell)?.repeatSchedule = (dataSource as? NewTaskOverlayDataSource)?.repeatSchedule ?? .never
		viewController?.update(at: indexPath)
	}
}
