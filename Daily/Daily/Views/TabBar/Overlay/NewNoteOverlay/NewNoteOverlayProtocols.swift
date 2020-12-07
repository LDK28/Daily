//
//  NewNoteOverlayProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//

import UIKit

protocol NewNoteOverlayDisplayLogic: OverlayDisplayLogic {
	func askRouterToNavigateToNotes()
}

protocol NewNoteOverlayBusinessLogic: OverlayBusinessLogic {
	func didEndEditingNote(text: String)
	
	func didTapSaveButton()
}

protocol NewNoteOverlayPresentationLogic: OverlayPresentationLogic {
	func prepareViewForRoutingToNotes()
}

protocol NewNoteOverlayRoutingLogic {
	func navigateToNotes() 
}

protocol NewNoteOverlayDataPassing {
	var dataStore: OverlayDataStore? { get }
}
