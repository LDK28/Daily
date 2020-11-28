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
	func deleteModels(pinnedNotesIndices: [Int],
					  unpinnedNotesIndices: [Int],
					  completion: @escaping () -> ())
	func updateModels(_ action: NotesUpdateAction,
					  atIndices indices: [Int],
					  completion: @escaping () -> ())
}

protocol NotesDataStore: AnyObject {
	var dataSource: NotesDataSource? { get set }
}

protocol NotesPresentationLogic {
	func present(notes: [NotesCellViewModel])
	func removeChosenNotes()
}

protocol NotesRoutingLogic {
	
}

protocol NotesDataPassing {
	var dataStore: NotesDataStore? { get }
}
