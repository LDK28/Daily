//
//  NewTaskOverlayProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//

import UIKit

protocol NewTaskOverlayDisplayLogic: OverlayDisplayLogic {
    func askRouterToNavigateToDiary()
}

protocol NewTaskOverlayBusinessLogic: OverlayBusinessLogic {
	func didToggleRemindSwitcher()
	
	func didTapRepeatCell(at indexPath: IndexPath)
	
	func didTapDateCell(at indexPath: IndexPath)
    
    func didTapSaveButton()
}

protocol NewTaskOverlayPresentationLogic: OverlayPresentationLogic {
	func updateRepeatCellViewModel(at indexPath: IndexPath)
    func prepareViewForRoutingToDiary()
}

protocol NewTaskOverlayRoutingLogic {
    func navigateToDiary()
}

protocol NewTaskOverlayDataPassing {
	var dataStore: OverlayDataStore? { get }
}
