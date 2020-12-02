//
//  NotesProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 19.11.2020.
//

import UIKit

protocol NotesDisplayLogic: AnyObject {
	var cellsToDisplay: [NotesCell] { get set }
	func finishDisplayingCells()
}

enum NotesUpdateAction {
	case pin, unpin
}

protocol NotesBusinessLogic {
	func fetchCells()
	func deleteModels(at indices: [Int],
					  completion: @escaping () -> ())
	func updateModels(_ action: NotesUpdateAction,
					  at indices: [Int],
					  completion: @escaping () -> ())
}

protocol NotesDataStore: AnyObject {
	var notes: [NotesCellViewModel] { get set }
}

protocol NotesPresentationLogic {
	func present(notes: [NotesCellViewModel])
	func removeChosenNotes()
	func rearrangeCells(_ notesViewModels: [NotesCellViewModel],
						moveFrom indices: [Int],
						moveTo index: Int)
}

protocol NotesRoutingLogic {
	
}

protocol NotesDataPassing {
	var dataStore: NotesDataStore? { get }
}
