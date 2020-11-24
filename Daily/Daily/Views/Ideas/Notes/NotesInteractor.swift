//
//  NotesInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 19.11.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit
import Firebase
import MobileCoreServices

class NotesInteractor: NotesDataStore {
	internal var dataSource: [NotesCellViewModel]
	private var presenter: NotesPresentationLogic?
	
	init(presenter: NotesPresentationLogic?) {
		self.dataSource = []
		self.presenter = presenter
	}
}

extension NotesInteractor: NotesBusinessLogic {
	func didTapTripletButton(at indexPath: IndexPath) {
		dataSource.remove(at: indexPath.row)
		presenter?.deleteNoteCell(at: indexPath)
	}
	
	func fetchCells() {
		UserRequest.shared.getNotes() { notes in
			self.dataSource = notes
			self.presenter?.present(notesCells: self.dataSource)
		}
	}
	
	func moveRowAt(sourceRow: Int, destinationRow: Int) {
		dataSource.insert(dataSource.remove(at: sourceRow), at: destinationRow)
		UserRequest.shared.update(notes: dataSource, completion: nil)
	}
	
}

extension NotesDataStore {
	/// The traditional method for rearranging rows in a table view.
	func moveItem(at sourceIndex: Int, to destinationIndex: Int) {
		guard sourceIndex != destinationIndex else { return }
		
		let place = dataSource[sourceIndex]
		dataSource.remove(at: sourceIndex)
		dataSource.insert(place, at: destinationIndex)
	}
	
	/// The method for adding a new item to the table view's data model.
	func addItem(_ place: NotesCellViewModel, at index: Int) {
		dataSource.insert(place, at: index)
	}
}

extension NotesDataStore {
	
	func canHandle(_ session: UIDropSession) -> Bool {
		return session.canLoadObjects(ofClass: NSString.self)
	}
	
	func dragItems(for indexPath: IndexPath) -> [UIDragItem] {
		let note = dataSource[indexPath.row]

		let data = try? JSONEncoder().encode(note)
		let itemProvider = NSItemProvider()
		
		itemProvider.registerDataRepresentation(forTypeIdentifier: kUTTypePlainText as String, visibility: .all) { completion in
			completion(data, nil)
			return nil
		}

		return [
			UIDragItem(itemProvider: itemProvider)
		]
	}
}
