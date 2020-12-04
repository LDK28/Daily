//
//  EditNoteProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 03.12.2020.
//

import UIKit

protocol EditNoteDisplayLogic: AnyObject {
  func fillFieldsWithNoteContent(_ data: NotesCellViewBackendModel)
}

protocol EditNoteBusinessLogic {
  func fetchNoteData()
	func didChange(title: String?, details: String?)
}

protocol EditNoteDataStore: AnyObject {
	var noteCellViewBackendModel: NotesCellViewBackendModel? { get set }
	var index: Int? { get set }
}

protocol EditNotePresentationLogic {
	func transferNoteDataToView(_ data: NotesCellViewBackendModel)
}

protocol EditNoteRoutingLogic {
	
}

protocol EditNoteDataPassing {
	var dataStore: EditNoteDataStore? { get }
	func integrateNoteInModule(_ note: NotesCellViewBackendModel, index: Int)
}
