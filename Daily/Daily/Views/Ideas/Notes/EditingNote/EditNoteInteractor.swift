//
//  EditNoteInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 03.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class EditNoteInteractor: EditNoteDataStore {
	var presenter: EditNotePresentationLogic?
	var noteCellViewBackendModel: NotesCellViewBackendModel?
}

extension EditNoteInteractor: EditNoteBusinessLogic {
	func doSomething() {
		
	}
}
