//
//  NotesProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 19.11.2020.
//

import UIKit

protocol NotesDisplayLogic: AnyObject {
	var cellsToDisplay: [MainCellViewModel] { get set }
	func displayCells()
	func updateViewModelForCell(at indexPaths: [IndexPath])
}

enum NotesUpdateAction {
	case pin, unpin
}

protocol NotesBusinessLogic {
	func fetchCells()
	func filterNotesThatHave(substring: String)
	func deleteModels(at indices: [Int],
					  completion: @escaping () -> ())
	func updateModels(_ action: NotesUpdateAction,
					  at indices: [Int],
					  completion: @escaping () -> ())
}

protocol NotesDataStore: AnyObject {
	var notes: [NotesCellViewBackendModel] { get set }
}

protocol NotesPresentationLogic {
	func present(notes: [NotesCellViewBackendModel])
	func removeNotes(at indices: [Int])
	func prepareFilteredNotes(_ notesCellViewBackdendModels: [NotesCellViewBackendModel])
}

protocol NotesRoutingLogic {
	func navigateToEditingNote(withViewModel viewModel: NotesCellViewBackendModel)
}

protocol NotesDataPassing {
	var dataStore: NotesDataStore? { get }
}
