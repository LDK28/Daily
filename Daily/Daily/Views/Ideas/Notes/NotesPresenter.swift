//
//  NotesPresenter.swift
//  Daily
//
//  Created by Арсений Токарев on 19.11.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class NotesPresenter {
	private weak var viewController: NotesDisplayLogic?
	
	init(viewController: NotesDisplayLogic?) {
		self.viewController = viewController
	}
	
}

extension NotesPresenter: NotesPresentationLogic {
	func updateNotesCells(with cellViewModel: NotesCellViewModel) {
		if let cell = (viewController as? NotesVC)?.tableView.dequeueReusableCell(withIdentifier: NotesCell.cellIdentifier) as? NotesCell {
			cell.viewModel = cellViewModel
			viewController?.cellsToDisplay.append(cell)
			viewController?.insert(at: IndexPath(row: 0, section: 0))
		}
	}

	
	func present(notesCells: [NotesCellViewModel]) {
		viewController?.cellsToDisplay.removeAll()
		for cellViewModel in notesCells {
			if let cell = (viewController as? NotesVC)?.tableView.dequeueReusableCell(withIdentifier: NotesCell.cellIdentifier) as?  NotesCell{
				cell.viewModel = cellViewModel
				viewController?.cellsToDisplay.append(cell)
			}
		}
		viewController?.displaySomething()
	}
}
