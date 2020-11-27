//
//  NotesProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 19.11.2020.
//

import UIKit

protocol NotesDisplayLogic: AnyObject {
	func finishDisplayingCells()
	var cellsToDisplay: [NotesCell] { get set }
	func insert(at: IndexPath)
	func delete(at indexPath: IndexPath)
}

protocol NotesBusinessLogic {
	func fetchCells()
	func deleteModels(at indices: [Int])
}

protocol NotesDataStore: AnyObject {
	var dataSource: NotesDataSource? { get set }
}

protocol NotesPresentationLogic {
	func present(notesCells: NotesDataSource)
	func updateNotesCells(with cellViewModel: NotesCellViewModel)
	func deleteNoteCell(at indexPath: IndexPath)
}

protocol NotesRoutingLogic {
	
}

protocol NotesDataPassing {
	var dataStore: NotesDataStore? { get }
}
