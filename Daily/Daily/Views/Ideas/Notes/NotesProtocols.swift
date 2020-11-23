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
	func didTapTripletButton(at indexPath: IndexPath)
}

protocol NotesDataStore: AnyObject {
	var dataSource: [NotesCellViewModel] { get set }
}

protocol NotesPresentationLogic {
	func present(notesCells: [NotesCellViewModel])
	func updateNotesCells(with cellViewModel: NotesCellViewModel)
	func deleteNoteCell(at indexPath: IndexPath)
}

protocol NotesRoutingLogic {
	
}

protocol NotesDataPassing {
	var dataStore: NotesDataStore? { get }
}
