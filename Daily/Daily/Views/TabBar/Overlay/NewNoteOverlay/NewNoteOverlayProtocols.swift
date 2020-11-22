//
//  NewNoteOverlayProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//

import UIKit

protocol NewNoteOverlayBusinessLogic: OverlayBusinessLogic {
	func didEndEditingNote(text: String)
	func didAddNewNote()
}

protocol NewNoteOverlayRoutingLogic {
}

protocol NewNoteOverlayDataPassing {
	var dataStore: OverlayDataStore? { get }
}
