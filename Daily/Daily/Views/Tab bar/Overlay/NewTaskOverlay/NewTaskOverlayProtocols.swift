//
//  NewTaskOverlayProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//

import UIKit

protocol  NewTaskOverlayDisplayLogic: OverlayDisplayLogic {
}

protocol NewTaskOverlayBusinessLogic: OverlayBusinessLogic {
	func didToggleRemindSwitcher()
}

protocol NewTaskOverlayPresentationLogic: OverlayPresentationLogic {
	
}

protocol NewTaskOverlayRoutingLogic {
	//func navigateTo()
}

protocol NewTaskOverlayDataPassing {
	//variable to transfer between screens
	var dataStore: OverlayDataStore? { get }
}
