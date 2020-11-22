//
//  NotesInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 19.11.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit
import Firebase

class NotesInteractor: NotesDataStore {
	internal var dataSource: [NotesCellViewModel]
	private var presenter: NotesPresentationLogic?
	
	init(presenter: NotesPresentationLogic?) {
		self.dataSource = []
		self.presenter = presenter
	}
}

extension NotesInteractor: NotesBusinessLogic {
	func fetchCells() {
		dataSource = UserRequest.shared.getNotes()
		presenter?.present(notesCells: dataSource)
	}
}
