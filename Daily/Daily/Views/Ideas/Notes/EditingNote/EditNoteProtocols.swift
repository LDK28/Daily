//
//  EditNoteProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 03.12.2020.
//

import UIKit

protocol EditNoteDisplayLogic: MainDisplayLogic {
	func updateCells()
}

protocol EditNoteBusinessLogic {
	func didChange(title: String?,
				   details: String?)
	
	func fetchCells()
}

protocol EditNoteDataStore: AnyObject {
	var noteCellViewBackendModel: NoteBackendModel? { get set }
	
	var index: Int? { get set }
}

protocol EditNotePresentationLogic {
	func present(title: String?,
				 description: String?)
	
	func handleCellChange()
}

protocol EditNoteRoutingLogic {
	
}

protocol EditNoteDataPassing {
	var dataStore: EditNoteDataStore? { get }
	
	func integrateNoteInModule(_ note: NoteBackendModel,
							   index: Int)
}
