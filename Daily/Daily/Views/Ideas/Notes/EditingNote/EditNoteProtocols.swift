//
//  EditNoteProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 03.12.2020.
//

import UIKit

protocol EditNoteDisplayLogic: AnyObject {
  func displaySomething()
}

protocol EditNoteBusinessLogic {
  func doSomething()
}

protocol EditNoteDataStore: AnyObject {
	var noteCellViewBackendModel: NotesCellViewBackendModel? { get set }
}

protocol EditNotePresentationLogic {
  func presentSomething()
}

protocol EditNoteRoutingLogic {
	
}

protocol EditNoteDataPassing {
	var dataStore: EditNoteDataStore? { get }
}
