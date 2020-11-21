//
//  NotesInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 19.11.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class NotesInteractor: NotesDataStore {
	var dataSource = NotesDataSource()
	
	var presenter: NotesPresentationLogic?
}

extension NotesInteractor: NotesBusinessLogic {
	func fetchCells() {
		presenter?.present()
	}
}
