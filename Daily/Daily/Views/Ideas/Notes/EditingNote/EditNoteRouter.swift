//
//  EditNoteRouter.swift
//  Daily
//
//  Created by Арсений Токарев on 03.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class EditNoteRouter: EditNoteDataPassing {
	
	weak var viewController: EditNoteVC?
	weak var dataStore: EditNoteDataStore?
  
}

extension EditNoteRouter: EditNoteRoutingLogic {
	func integrateNoteInModule(_ note: NoteBackendModel, index: Int) {
		dataStore?.noteCellViewBackendModel = note
		dataStore?.index = index
	}
}
