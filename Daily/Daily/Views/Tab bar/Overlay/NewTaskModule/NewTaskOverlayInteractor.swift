//
//  NewTaskOverlayInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 05.11.2020.
//

import UIKit

class NewTaskOverlayInteractor: OverlayInteractor {
}

// MARK: - Interactor Protocol

extension NewTaskOverlayInteractor: NewTaskOverlayBusinessLogic {
	func didToggleRemindSwitcher() {
		(dataSource as? NewTaskOverlayDataSource)?.shouldRemind.toggle()
	}
}
