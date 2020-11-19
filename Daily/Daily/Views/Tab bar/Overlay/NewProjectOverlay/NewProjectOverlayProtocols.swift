//
//  NewProjectOverlayProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//

import UIKit

protocol NewProjectOverlayBusinessLogic: OverlayBusinessLogic {
	func didToggleDateSwitcher()
	func didToggleTeamProjectSwitcher()
}

protocol NewProjectOverlayPresentationLogic: OverlayPresentationLogic {
}

protocol NewProjectOverlayRoutingLogic {
}

protocol NewProjectOverlayDataPassing {
	var dataStore: OverlayDataStore? { get }
}
