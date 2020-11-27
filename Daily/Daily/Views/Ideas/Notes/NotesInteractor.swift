//
//  NotesInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 19.11.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit
import Firebase

class NotesInteractor: NotesDataStore {
	internal var dataSource: NotesDataSource?
	private var presenter: NotesPresentationLogic?
	
	init(presenter: NotesPresentationLogic?) {
		self.presenter = presenter
	}
}

extension NotesInteractor: NotesBusinessLogic {
	func deleteModels(pinnedNotesIndices: [Int],
					  unpinnedNotesIndices: [Int],
					  completion: @escaping () -> ()) {
		guard dataSource != nil else {
			completion()
			return
		}
		dataSource?.pinnedNotes.remove(at: pinnedNotesIndices)
		dataSource?.unpinnedNotes.remove(at: unpinnedNotesIndices)
		UserRequest.shared.update(notes: dataSource ?? NotesDataSource()) {
			self.presenter?.removeChosenNotes()
			completion()
		}
		
	}
	
	func fetchCells() {
		UserRequest.shared.getNotes() { dataSource in
			guard let dataSource = dataSource else { return }
			self.dataSource = dataSource
			self.presenter?.present(notes: dataSource.allNotes)
		}
	}
}
