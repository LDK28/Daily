//
//  NewProjectOverlayProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//

import UIKit

protocol NewProjectOverlayDisplayLogic: OverlayDisplayLogic {
	
}

protocol NewProjectOverlayBusinessLogic: OverlayBusinessLogic {
	func didToggleDateSwitcher()
	func didChangeValueInDatePickerCell(newDay: Date)
	func didToggleTeamProjectSwitcher()
}

protocol NewProjectOverlayPresentationLogic: OverlayPresentationLogic {
	func updateDateInDateCell(atSection section: Int)
}
