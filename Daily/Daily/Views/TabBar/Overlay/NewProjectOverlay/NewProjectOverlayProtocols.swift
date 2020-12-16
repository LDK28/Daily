//
//  NewProjectOverlayProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//

import UIKit

protocol NewProjectOverlayDisplayLogic: OverlayDisplayLogic {
    func askRouterToNavigateToProjects()
}

protocol NewProjectOverlayBusinessLogic: OverlayBusinessLogic {
	func didToggleDateSwitcher()
	func didToggleTeamProjectSwitcher()
    func didTapAddButton()
    func didEndEditingNote(text: String)
}

protocol NewProjectOverlayPresentationLogic: OverlayPresentationLogic {
    func prepareViewForRoutingToProjects()
}

protocol NewProjectOverlayRoutingLogic {
    func navigateToProjects()
}

protocol NewProjectOverlayDataPassing {
	var dataStore: OverlayDataStore? { get }
}
