//
//  NewTaskOverlayProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//

import UIKit

protocol NewTaskOverlayBusinessLogic: OverlayBusinessLogic {
	func didToggleRemindSwitcher()
}

protocol NewTaskOverlayPresentationLogic: OverlayPresentationLogic {
	//changes title in the repeat cell...
}

protocol NewTaskOverlayRoutingLogic {
}

protocol NewTaskOverlayDataPassing {
	var dataStore: OverlayDataStore? { get }
}
