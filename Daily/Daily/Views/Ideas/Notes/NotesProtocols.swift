//
//  NotesProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 19.11.2020.
//

import UIKit

protocol NotesDisplayLogic: AnyObject {
  func displaySomething()
}

protocol NotesBusinessLogic {
  func doSomething()
}

protocol NotesDataStore: AnyObject {
	
}

protocol NotesPresentationLogic {
  func presentSomething()
}

protocol NotesRoutingLogic {
	
}

protocol NotesDataPassing {
	var dataStore: NotesDataStore? { get }
}
