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
	func didTapTripletButton(at indexPath: IndexPath) {
		dataSource.remove(at: indexPath.row)
		presenter?.deleteNoteCell(at: indexPath)
	}
	
	func fetchCells() {
		UserRequest.shared.getNotes() { cellViewModels in
			self.dataSource = cellViewModels
			self.presenter?.present(notesCells: self.dataSource)
		}
	}
}
