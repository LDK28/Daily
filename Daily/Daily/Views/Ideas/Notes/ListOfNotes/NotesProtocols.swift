//
//  NotesProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 19.11.2020.
//

import UIKit

protocol NotesDisplayLogic: AnyObject {
	var cellsToDisplay: [MainCellViewModel] { get set }
	func showAllCells()
	func showFilteredCells(thatHaveSubstring substring: String)
	func updateViewModelForCell(at indexPaths: [IndexPath])
}

enum NotesUpdateAction {
	case pin, unpin
}

protocol NotesBusinessLogic {
	func fetchLatestData(latestInputInSearchBar: String?)
	func giveIndexOfNote(withViewModel viewModel: NotesCellTableViewModel,
						 completion: @escaping (Int?) -> ())
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
	func presentFilteredNotes(notes: [NotesCellViewBackendModel], withSubstring substring: String)
	func removeNotes(at indices: [Int])
}

protocol NotesRoutingLogic {
	func navigateToEditingNote(withViewModel viewModel: NotesCellViewBackendModel,
							   withIndex index: Int)
}

protocol NotesDataPassing {
	var dataStore: NotesDataStore? { get }
}
