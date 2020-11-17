//
//  NewNoteOverlayProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//

import UIKit

protocol NewNoteOverlayDisplayLogic: OverlayDisplayLogic {
}

protocol NewNoteOverlayBusinessLogic: OverlayBusinessLogic {
	func didEndEditingNote(text: String)
}

protocol NewNoteOverlayPresentationLogic: OverlayPresentationLogic {
	
}

protocol NewNoteOverlayRoutingLogic {
	//func navigateTo()
}

protocol NewNoteOverlayDataPassing {
	//variable to transfer between screens
	var dataStore: OverlayDataStore? { get }
}
