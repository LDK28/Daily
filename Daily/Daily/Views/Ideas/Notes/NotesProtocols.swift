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
}

protocol NotesBusinessLogic {
	func fetchCells()
}

protocol NotesDataStore: AnyObject {
	var dataSource: NotesDataSource { get set }
}

protocol NotesPresentationLogic {
	func present()
}

protocol NotesRoutingLogic {
	
}

protocol NotesDataPassing {
	var dataStore: NotesDataStore? { get }
}
