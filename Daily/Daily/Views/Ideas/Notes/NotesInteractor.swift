//
//  NotesInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 19.11.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class NotesInteractor: NotesDataStore {
	internal var dataSource: [NotesCellViewModel]
	private var presenter: NotesPresentationLogic?
	
	init(presenter: NotesPresentationLogic?, dataSource: [NotesCellViewModel]) {
		self.dataSource = dataSource
		self.presenter = presenter
	}
}

extension NotesInteractor: NotesBusinessLogic {
	func fetchCells() {
		presenter?.present(notesCells: dataSource)
	}
}
