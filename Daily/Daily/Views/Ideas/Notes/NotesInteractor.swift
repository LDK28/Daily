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
	internal var dataSource: NotesDataSource?
	private var presenter: NotesPresentationLogic?
	
	init(presenter: NotesPresentationLogic?) {
		self.presenter = presenter
	}
}

extension NotesInteractor: NotesBusinessLogic {
	func deleteModels(at indices: [Int]) {
		guard dataSource != nil else { return }
		for i in indices {
			//dataSource?.
		}
	}
	
	func fetchCells() {
		UserRequest.shared.getNotes() { notes in
			guard let notes = notes else { return }
			self.dataSource = notes
			self.presenter?.present(notesCells: notes)
		}
	}
}
