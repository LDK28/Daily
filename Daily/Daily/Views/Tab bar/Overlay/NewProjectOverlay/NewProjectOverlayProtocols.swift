//
//  NewProjectOverlayProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//

import UIKit

protocol NewProjectOverlayBusinessLogic: OverlayBusinessLogic {
	func didToggleDateSwitcher()
	func didChangeValueInDatePickerCell(newDay: Date)
	func didToggleTeamProjectSwitcher()
}

protocol NewProjectOverlayPresentationLogic: OverlayPresentationLogic {
	func updateDateInDateCell(atSection section: Int)
}

protocol NewProjectOverlayRoutingLogic {
}

protocol NewProjectOverlayDataPassing {
	var dataStore: OverlayDataStore? { get }
}
