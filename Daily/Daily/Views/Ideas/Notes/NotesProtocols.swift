//
//  NotesProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 19.11.2020.
//

import UIKit

protocol NotesDisplayLogic: AnyObject {
	func displaySomething()
	var cellsToDisplay: [NotesCell] { get set }
	func insert(at: IndexPath)
}

protocol NotesBusinessLogic {
	func fetchCells()
}

protocol NotesDataStore: AnyObject {
	var dataSource: [NotesCellViewModel] { get set }
}

protocol NotesPresentationLogic {
	func present(notesCells: [NotesCellViewModel])
	func updateNotesCells(with cellViewModel: NotesCellViewModel)
}

protocol NotesRoutingLogic {
	
}

protocol NotesDataPassing {
	var dataStore: NotesDataStore? { get }
}
