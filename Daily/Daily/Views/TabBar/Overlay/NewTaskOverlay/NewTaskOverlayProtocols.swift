//
//  NewTaskOverlayProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//

import UIKit

protocol NewTaskOverlayBusinessLogic: OverlayBusinessLogic {
	func didToggleRemindSwitcher()
	
	func didTapRepeatCell(at indexPath: IndexPath)
	
	func didTapDateCell(at indexPath: IndexPath)
}

protocol NewTaskOverlayPresentationLogic: OverlayPresentationLogic {
	func updateRepeatCellViewModel(at indexPath: IndexPath)
}

protocol NewTaskOverlayRoutingLogic {
}

protocol NewTaskOverlayDataPassing {
	var dataStore: OverlayDataStore? { get }
}
