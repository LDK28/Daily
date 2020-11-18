//
//  NewTaskOverlayProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//

import UIKit

protocol NewTaskOverlayBusinessLogic: OverlayBusinessLogic {
	func didToggleRemindSwitcher()
	func didTapRepeatCell()
}

protocol NewTaskOverlayPresentationLogic: OverlayPresentationLogic {
	func updateRepeatCell(atSection section: Int)
}

protocol NewTaskOverlayRoutingLogic {
}

protocol NewTaskOverlayDataPassing {
	var dataStore: OverlayDataStore? { get }
}
